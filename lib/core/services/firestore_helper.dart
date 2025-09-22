import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_verification_data.dart';

class FirestoreHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Add sample user data to Firestore
  /// Returns true on success, false on failure
  Future<bool> addSampleUserData() async {
    final sampleUser = UserVerificationData(
      address: "chennai",
      contractAddress: "0x47147B2DFdD033C2c8941F3C72bE74a8977Fde4a",
      createdAt: DateTime.parse("2025-09-21T06:52:18.571Z"),
      dob: "1990-01-01",
      documentHash: "711fe70a25a27908ea24b7ffbaf79b1d5d6155a0cda9495edcca31ca9e1139b3",
      documentNumber: "123456789012",
      documentType: "AADHAAR",
      eKYCStatus: "verified",
      emergencyContact: "12345678909",
      expiryDate: DateTime.parse("2025-10-04T06:52:18.571Z"),
      isActive: true,
      itinerary: "chennai,bangalore,karnataka",
      itineraryHash: "82eee895aa413f0c63750d5b03231640fb9ea232c820445044fd0454252bd87b",
      name: "John Doe",
      nationality: "indian",
      nftMintStatus: "success",
      nftTokenId: "1",
      profilePhotoHash: "ee564ea11d546318870577d5060b98cf96b1affa4897640ba9b97f0c3ed9c98a",
      registrationStatus: "completed",
      transactionHash: "0x2a0d6a9e22a8608997537db095a4a89744adea589db82f7c26a4512e7300fa1a",
      verificationTimestamp: DateTime.parse("2025-09-21T06:52:18.571Z"),
      visitDurationDays: 13,
      walletAddress: "0x53033920A18C71173b5656e8E3207bfA8f6c13D1",
    );

    try {
      await _firestore
          .collection('users')
          .doc('LoFJIhJzHSLwajqZqHdv')
          .set(sampleUser.toMap());
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Get all users from Firestore
  /// Returns an empty list if something goes wrong
  Future<List<UserVerificationData>> getAllUsers() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('users').get();

      return querySnapshot.docs
          .map((doc) => UserVerificationData.fromFirestore(doc))
          .toList();
    } catch (_) {
      return [];
    }
  }

  /// Delete all users from Firestore
  /// Returns the count of deleted documents
  Future<int> deleteAllUsers() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('users').get();

      int deletedCount = 0;
      for (DocumentSnapshot doc in querySnapshot.docs) {
        await doc.reference.delete();
        deletedCount++;
      }
      return deletedCount;
    } catch (_) {
      return 0;
    }
  }
}
