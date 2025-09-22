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

    DateTime? parseDate(dynamic v) {
      if (v == null) return null;
      if (v is Timestamp) return v.toDate();
      if (v is String) {
        try {
          return DateTime.parse(v);
        } catch (_) {
          return null; // silently fail
        }
      }
      return null; // unsupported type
    }

    int? parseInt(dynamic v) {
      if (v == null) return null;
      if (v is int) return v;
      if (v is double) return v.toInt();
      if (v is String) return int.tryParse(v);
      return null;
    }

    bool? parseBool(dynamic v) {
      if (v == null) return null;
      if (v is bool) return v;
      if (v is num) return v != 0;
      if (v is String) {
        final s = v.toLowerCase();
        if (s == 'true' || s == '1' || s == 'yes') return true;
        if (s == 'false' || s == '0' || s == 'no') return false;
        return null;
      }
      return null;
    }

    String? parseString(dynamic v) {
      if (v == null) return null;
      if (v is String) return v;
      return v.toString();
    }

    return UserVerificationData(
      address: parseString(data['address']),
      contractAddress: parseString(data['contractAddress']),
      createdAt: parseDate(data['createdAt']),
      dob: parseString(data['dob']),
      documentHash: parseString(data['documentHash']),
      documentNumber: parseString(data['documentNumber']),
      documentType: parseString(data['documentType']),
      eKYCStatus: parseString(data['eKYCStatus']),
      emergencyContact: parseString(data['emergencyContact']),
      expiryDate: parseDate(data['expiryDate']),
      isActive: parseBool(data['isActive']),
      itinerary: parseString(data['itinerary']),
      itineraryHash: parseString(data['itineraryHash']),
      name: parseString(data['name']),
      nationality: parseString(data['nationality']),
      nftMintStatus: parseString(data['nftMintStatus']),
      nftTokenId: parseString(data['nftTokenId']),
      profilePhotoHash: parseString(data['profilePhotoHash']),
      registrationStatus: parseString(data['registrationStatus']),
      transactionHash: parseString(data['transactionHash']),
      verificationTimestamp: parseDate(data['verificationTimestamp']),
      visitDurationDays: parseInt(data['visitDurationDays']),
      walletAddress: parseString(data['walletAddress']),
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
