# Firebase Integration for Tourist Safety App

This document explains how to set up and use Firebase to read user verification data stored in Firestore.

## Setup

### 1. Firebase Configuration
Firebase is already configured in the project. The configuration files are:
- `firebase_options.dart` - Contains Firebase project configuration
- Firebase is initialized in `main.dart`

### 2. Dependencies
The following Firebase dependencies are already included in `pubspec.yaml`:
- `firebase_core: ^2.24.2`
- `firebase_auth: ^4.15.3`
- `cloud_firestore: ^4.15.8`

## Data Model

The user verification data is stored in Firestore with the following structure:

```dart
{
  "address": "chennai",
  "contractAddress": "0x47147B2DFdD033C2c8941F3C72bE74a8977Fde4a",
  "createdAt": "2025-09-21T06:52:18.571Z",
  "dob": "1990-01-01",
  "documentHash": "711fe70a25a27908ea24b7ffbaf79b1d5d6155a0cda9495edcca31ca9e1139b3",
  "documentNumber": "123456789012",
  "documentType": "AADHAAR",
  "eKYCStatus": "verified",
  "emergencyContact": "12345678909",
  "expiryDate": "2025-10-04T06:52:18.571Z",
  "isActive": true,
  "itinerary": "chennai,bangalore,karnataka",
  "itineraryHash": "82eee895aa413f0c63750d5b03231640fb9ea232c820445044fd0454252bd87b",
  "name": "John Doe",
  "nationality": "indian",
  "nftMintStatus": "success",
  "nftTokenId": "1",
  "profilePhotoHash": "ee564ea11d546318870577d5060b98cf96b1affa4897640ba9b97f0c3ed9c98a",
  "registrationStatus": "completed",
  "transactionHash": "0x2a0d6a9e22a8608997537db095a4a89744adea589db82f7c26a4512e7300fa1a",
  "verificationTimestamp": "2025-09-21T06:52:18.571Z",
  "visitDurationDays": 13,
  "walletAddress": "0x53033920A18C71173b5656e8E3207bfA8f6c13D1"
}
```

## Usage

### 1. Using the UserProvider

The `UserProvider` manages user data state and provides easy access to user information:

```dart
// Load user data by wallet address
await context.read<UserProvider>().loadUserData('0x53033920A18C71173b5656e8E3207bfA8f6c13D1');

// Access user data
final userName = context.watch<UserProvider>().userName;
final isVerified = context.watch<UserProvider>().isUserVerified;
final nationality = context.watch<UserProvider>().userNationality;
final emergencyContact = context.watch<UserProvider>().emergencyContact;
```

### 2. Using Consumer Widget

```dart
Consumer<UserProvider>(
  builder: (context, userProvider, child) {
    return Text(userProvider.userName);
  },
)
```

### 3. Adding Sample Data (for testing)

```dart
final firestoreHelper = FirestoreHelper();
await firestoreHelper.addSampleUserData();
```

## Firestore Security Rules

Make sure to set up proper security rules in your Firebase console:

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      // Allow read access to user data
      allow read: if true;

      // Allow write access only for authenticated users (adjust as needed)
      allow write: if request.auth != null;
    }
  }
}
```

## Features Implemented

1. ✅ **User Data Model** - Complete data structure for user verification
2. ✅ **Firebase Service** - Service layer for Firestore operations
3. ✅ **User Provider** - State management for user data
4. ✅ **Profile Screen Integration** - Dynamic data display in UI
5. ✅ **Helper Utilities** - Sample data and testing utilities

## Next Steps

1. **Load Data in Onboarding Screen** - Update onboarding to fetch user data
2. **Add Error Handling** - Implement proper error states and loading indicators
3. **Offline Support** - Add offline data persistence
4. **Real-time Updates** - Listen to real-time data changes
5. **Security** - Implement proper authentication and authorization

## Testing

To test the integration:

1. Run the app
2. Navigate to Profile screen
3. The app will show loading states initially
4. Add sample data using `FirestoreHelper`
5. Data should appear in the Profile screen automatically

## Troubleshooting

- Make sure Firebase project is properly configured
- Check Firestore security rules allow read access
- Verify data exists in Firestore with correct field names
- Check console logs for any Firebase errors
