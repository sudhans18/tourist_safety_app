import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/user_verification_data.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Collection name for user verification data
  static const String _usersCollection = 'Users';

  FirebaseService() {
    // Ensure offline persistence is enabled (mobile SDKs enable by default).
    // Wrap in try/catch to avoid platform-specific errors (e.g., web).
    try {
      _firestore.settings = const Settings(
        persistenceEnabled: true,
        cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
      );
    } catch (_) {
      // Ignore if not supported on this platform.
    }
  }

  /// Get user data by document ID
  Future<UserVerificationData?> getUserData(String documentId) async {
    try {
      final doc = await _firestore
          .collection(_usersCollection)
          .doc(documentId)
          .get();
      if (doc.exists) {
        return UserVerificationData.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      // Propagate error to caller for better handling in Provider/UI.
      rethrow;
    }
  }

  /// Get user data by document number (for KYC verification)
  Future<UserVerificationData?> getUserDataByDocumentNumber(String documentNumber) async {
    try {
      final querySnapshot = await _firestore
          .collection(_usersCollection)
          .where('documentNumber', isEqualTo: documentNumber)
          .limit(1)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        return UserVerificationData.fromFirestore(querySnapshot.docs.first);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  /// Stream user data for real-time updates
  Stream<UserVerificationData?> getUserDataStream(String documentId) {
    return _firestore
        .collection(_usersCollection)
        .doc(documentId)
        .snapshots()
        .map((doc) {
      if (doc.exists) {
        return UserVerificationData.fromFirestore(doc);
      }
      return null;
    });
  }

  /// Prefer cached data first (for offline), then fall back to server.
  /// Throws if server fetch fails so the caller can surface the error.
  Future<UserVerificationData?> getUserDataPreferCacheThenServer(String documentId) async {
    // 1) Try cache
    try {
      final cachedDoc = await _firestore
          .collection(_usersCollection)
          .doc(documentId)
          .get(const GetOptions(source: Source.cache));
      if (cachedDoc.exists) {
        return UserVerificationData.fromFirestore(cachedDoc);
      }
    } catch (_) {
      // Ignore cache errors; proceed to server.
    }

    // 2) Fallback to server
    final serverDoc = await _firestore
        .collection(_usersCollection)
        .doc(documentId)
        .get(const GetOptions(source: Source.server));
    if (serverDoc.exists) {
      return UserVerificationData.fromFirestore(serverDoc);
    }
    return null;
  }

  /// Fetch from server only (bypass cache), useful for pull-to-refresh.
  Future<UserVerificationData?> getUserDataServerOnly(String documentId) async {
    final serverDoc = await _firestore
        .collection(_usersCollection)
        .doc(documentId)
        .get(const GetOptions(source: Source.server));
    if (serverDoc.exists) {
      return UserVerificationData.fromFirestore(serverDoc);
    }
    return null;
  }

  /// Check if user is verified and active
  Future<bool> isUserVerified(String documentId) async {
    try {
      final userData = await getUserData(documentId);
      return userData?.isActive == true &&
          userData?.registrationStatus == 'completed' &&
          userData?.eKYCStatus == 'verified';
    } catch (e) {
      return false;
    }
  }

  /// Update user's profile photo in Firestore
  Future<void> updateUserProfilePhoto(String documentId, String photoUrl) async {
    try {
      await _firestore
          .collection(_usersCollection)
          .doc(documentId)
          .update({'profilePhotoHash': photoUrl});
    } catch (e) {
      debugPrint('FirebaseService: updateUserProfilePhoto error: $e');
      rethrow;
    }
  }
}
