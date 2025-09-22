import 'package:flutter/foundation.dart';
import '../models/user_verification_data.dart';
import '../services/firebase_service.dart';
import 'dart:async';

class UserProvider extends ChangeNotifier {
  final FirebaseService _firebaseService = FirebaseService();

  UserVerificationData? _userData;
  bool _isLoading = false;
  String? _error;
  bool _isRefreshing = false;
  String? _activeWalletAddress;
  DateTime? _lastUpdatedAt;
  StreamSubscription<UserVerificationData?>? _subscription;

  // Getters
  UserVerificationData? get userData => _userData;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isRefreshing => _isRefreshing;
  String? get activeWalletAddress => _activeWalletAddress;
  DateTime? get lastUpdatedAt => _lastUpdatedAt;

  // Computed getters for UI
  bool get isUserVerified => _userData != null &&
      _userData!.isActive == true &&
      _userData!.registrationStatus == 'completed' &&
      _userData!.eKYCStatus == 'verified';

  String get userName => _userData?.name ?? 'Unknown User';
  String get userNationality => _userData?.nationality ?? 'Unknown';
  String get userDocumentType => _userData?.documentType ?? 'Unknown';
  String get userItinerary => _userData?.itinerary ?? 'Not specified';
  String get emergencyContact => _userData?.emergencyContact ?? 'Not set';
  int get visitDurationDays => _userData?.visitDurationDays ?? 0;
  String get walletAddress => _userData?.walletAddress ?? 'Not available';

  /// Load user data by document ID
  Future<void> loadUserData(String documentId) async {
    _setLoading(true);

    try {
      debugPrint('UserProvider: Loading user data for documentId=$documentId');
      _activeWalletAddress = documentId; // Keep for backward compatibility
      _userData = await _firebaseService.getUserDataPreferCacheThenServer(documentId);
      _error = null;
      _lastUpdatedAt = DateTime.now();
      debugPrint('UserProvider: Loaded user data (cached/server). lastUpdatedAt=$_lastUpdatedAt');

      // Debug logging for parsed fields
      if (_userData != null) {
        debugPrint('UserProvider: DEBUG - Parsed user data:');
        debugPrint('  name: ${_userData!.name}');
        debugPrint('  nationality: ${_userData!.nationality}');
        debugPrint('  isActive: ${_userData!.isActive}');
        debugPrint('  registrationStatus: ${_userData!.registrationStatus}');
        debugPrint('  eKYCStatus: ${_userData!.eKYCStatus}');
        debugPrint('  documentType: ${_userData!.documentType}');
        debugPrint('  visitDurationDays: ${_userData!.visitDurationDays}');
        debugPrint('  createdAt: ${_userData!.createdAt}');
        debugPrint('  walletAddress: ${_userData!.walletAddress}');
      } else {
        debugPrint('UserProvider: DEBUG - User data is null after loading');
      }
    } catch (e) {
      debugPrint('UserProvider: loadUserData error: $e');
      _error = e.toString();
      _userData = null;
    } finally {
      _setLoading(false);
    }
  }

  /// Load user data by document number
  Future<void> loadUserDataByDocumentNumber(String documentNumber) async {
    _setLoading(true);

    try {
      _userData = await _firebaseService.getUserDataByDocumentNumber(documentNumber);
      _error = null;
      _lastUpdatedAt = DateTime.now();
    } catch (e) {
      _error = e.toString();
      _userData = null;
    } finally {
      _setLoading(false);
    }
  }

  /// Listen to real-time user data updates
  void listenToUserData(String documentId) {
    _subscription?.cancel();
    _subscription = _firebaseService.getUserDataStream(documentId).listen(
      (userData) {
        _userData = userData;
        _error = null;
        _lastUpdatedAt = DateTime.now();
        debugPrint('UserProvider: Realtime update received. lastUpdatedAt=$_lastUpdatedAt');
        notifyListeners();
      },
      onError: (error) {
        debugPrint('UserProvider: Realtime stream error: $error');
        _error = error.toString();
        notifyListeners();
      },
    );
  }

  /// Clear user data
  void clearUserData() {
    _userData = null;
    _error = null;
    notifyListeners();
  }

  /// Get user display information
  Map<String, String?> getUserDisplayInfo() {
    return _firebaseService.getUserDisplayInfo(_userData);
  }

  /// Check if user is verified
  Future<bool> checkUserVerification(String documentId) async {
    return await _firebaseService.isUserVerified(documentId);
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setRefreshing(bool refreshing) {
    _isRefreshing = refreshing;
    notifyListeners();
  }

  /// Initialize provider with document ID and subscribe to realtime updates
  Future<void> initialize({required String documentId}) async {
    debugPrint('UserProvider: Initializing with documentId=$documentId');
    _activeWalletAddress = documentId; // Keep for backward compatibility
    await loadUserData(documentId);
    listenToUserData(documentId);
  }

  /// Pull-to-refresh: force server fetch; keep cached data if server fails
  Future<void> refresh() async {
    final documentId = _activeWalletAddress;
    if (documentId == null) return;
    _setRefreshing(true);
    try {
      debugPrint('UserProvider: Refreshing from server for documentId=$documentId');
      final fresh = await _firebaseService.getUserDataServerOnly(documentId);
      _userData = fresh ?? _userData; // keep old cached if null
      _error = null;
      _lastUpdatedAt = DateTime.now();
      debugPrint('UserProvider: Refresh completed. lastUpdatedAt=$_lastUpdatedAt');
    } catch (e) {
      debugPrint('UserProvider: Refresh error: $e');
      _error = e.toString();
    } finally {
      _setRefreshing(false);
    }
  }

  /// Retry last failed operation (simply re-load current document ID)
  Future<void> retry() async {
    final documentId = _activeWalletAddress;
    if (documentId == null) return;
    debugPrint('UserProvider: Retrying load for documentId=$documentId');
    await loadUserData(documentId);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
