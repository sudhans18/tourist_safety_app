import 'package:cloud_firestore/cloud_firestore.dart';

class UserVerificationData {
  final String? address;
  final String? contractAddress;
  final DateTime? createdAt;
  final String? dob;
  final String? documentHash;
  final String? documentNumber;
  final String? documentType;
  final String? eKYCStatus;
  final String? emergencyContact;
  final DateTime? expiryDate;
  final bool? isActive;
  final String? itinerary;
  final String? itineraryHash;
  final String? name;
  final String? nationality;
  final String? nftMintStatus;
  final String? nftTokenId;
  final String? profilePhotoHash;
  final String? registrationStatus;
  final String? transactionHash;
  final DateTime? verificationTimestamp;
  final int? visitDurationDays;
  final String? walletAddress;

  UserVerificationData({
    this.address,
    this.contractAddress,
    this.createdAt,
    this.dob,
    this.documentHash,
    this.documentNumber,
    this.documentType,
    this.eKYCStatus,
    this.emergencyContact,
    this.expiryDate,
    this.isActive,
    this.itinerary,
    this.itineraryHash,
    this.name,
    this.nationality,
    this.nftMintStatus,
    this.nftTokenId,
    this.profilePhotoHash,
    this.registrationStatus,
    this.transactionHash,
    this.verificationTimestamp,
    this.visitDurationDays,
    this.walletAddress,
  });

  factory UserVerificationData.fromFirestore(DocumentSnapshot doc) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // Debug logging for raw data
    print('UserVerificationData: DEBUG - Raw Firestore data:');
    data.forEach((key, value) {
      print('  $key: $value (type: ${value.runtimeType})');
    });

    DateTime? _parseDate(dynamic v) {
      if (v == null) return null;
      if (v is Timestamp) return v.toDate();
      if (v is String) {
        try {
          return DateTime.parse(v);
        } catch (_) {
          print('UserVerificationData: Failed to parse date string: $v');
          return null;
        }
      }
      print('UserVerificationData: Unsupported date type: ${v.runtimeType}');
      return null;
    }

    int? _parseInt(dynamic v) {
      if (v == null) return null;
      if (v is int) return v;
      if (v is double) return v.toInt();
      if (v is String) {
        final parsed = int.tryParse(v);
        if (parsed == null) print('UserVerificationData: Failed to parse int string: $v');
        return parsed;
      }
      print('UserVerificationData: Unsupported int type: ${v.runtimeType}');
      return null;
    }

    bool? _parseBool(dynamic v) {
      if (v == null) return null;
      if (v is bool) return v;
      if (v is num) return v != 0;
      if (v is String) {
        final s = v.toLowerCase();
        if (s == 'true' || s == '1' || s == 'yes') return true;
        if (s == 'false' || s == '0' || s == 'no') return false;
        print('UserVerificationData: Failed to parse bool string: $v');
        return null;
      }
      print('UserVerificationData: Unsupported bool type: ${v.runtimeType}');
      return null;
    }

    String? _parseString(dynamic v) {
      if (v == null) return null;
      if (v is String) return v;
      return v.toString();
    }

    return UserVerificationData(
      address: _parseString(data['address']),
      contractAddress: _parseString(data['contractAddress']),
      createdAt: _parseDate(data['createdAt']),
      dob: _parseString(data['dob']),
      documentHash: _parseString(data['documentHash']),
      documentNumber: _parseString(data['documentNumber']),
      documentType: _parseString(data['documentType']),
      eKYCStatus: _parseString(data['eKYCStatus']),
      emergencyContact: _parseString(data['emergencyContact']),
      expiryDate: _parseDate(data['expiryDate']),
      isActive: _parseBool(data['isActive']),
      itinerary: _parseString(data['itinerary']),
      itineraryHash: _parseString(data['itineraryHash']),
      name: _parseString(data['name']),
      nationality: _parseString(data['nationality']),
      nftMintStatus: _parseString(data['nftMintStatus']),
      nftTokenId: _parseString(data['nftTokenId']),
      profilePhotoHash: _parseString(data['profilePhotoHash']),
      registrationStatus: _parseString(data['registrationStatus']),
      transactionHash: _parseString(data['transactionHash']),
      verificationTimestamp: _parseDate(data['verificationTimestamp']),
      visitDurationDays: _parseInt(data['visitDurationDays']),
      walletAddress: _parseString(data['walletAddress']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'contractAddress': contractAddress,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      'dob': dob,
      'documentHash': documentHash,
      'documentNumber': documentNumber,
      'documentType': documentType,
      'eKYCStatus': eKYCStatus,
      'emergencyContact': emergencyContact,
      'expiryDate': expiryDate != null ? Timestamp.fromDate(expiryDate!) : null,
      'isActive': isActive,
      'itinerary': itinerary,
      'itineraryHash': itineraryHash,
      'name': name,
      'nationality': nationality,
      'nftMintStatus': nftMintStatus,
      'nftTokenId': nftTokenId,
      'profilePhotoHash': profilePhotoHash,
      'registrationStatus': registrationStatus,
      'transactionHash': transactionHash,
      'verificationTimestamp': verificationTimestamp != null
          ? Timestamp.fromDate(verificationTimestamp!)
          : null,
      'visitDurationDays': visitDurationDays,
      'walletAddress': walletAddress,
    };
  }

  @override
  String toString() {
    return 'UserVerificationData('
        'name: $name, '
        'nationality: $nationality, '
        'documentType: $documentType, '
        'walletAddress: $walletAddress, '
        'isActive: $isActive, '
        'registrationStatus: $registrationStatus)';
  }
}
