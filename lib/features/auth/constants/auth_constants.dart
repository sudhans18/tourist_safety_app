import 'package:flutter/material.dart';
import 'package:tourist_safety_app/core/constants/app_constants.dart';

/// Constants specific to the auth feature
class AuthConstants {
  // Auth colors
  static const Color primaryColor = Color(0xFFD93F34);
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color borderColor = Color(0xFFD1D5DB);
  static const Color focusBorderColor = Color(0xFFD93F34);

  // Layout constants
  static const double cardPadding = AppConstants.spacingMd;
  static const double cardBorderRadius = AppConstants.radiusMd;
  static const double sectionSpacing = AppConstants.spacingMd;
  static const double contentSpacing = AppConstants.spacingSm;
  static const double inputSpacing = AppConstants.spacingLg;

  // Text sizes
  static const double titleSize = 20.0;
  static const double inputSize = 16.0;
  static const double hintSize = 16.0;

  // Input field constants
  static const String defaultCountryCode = '+91';
  static const String phoneHint = '+91XXXXXXXXXX';
  static const String otpHint = '------';
  static const int otpLength = 6;
}

/// Auth verification states
enum AuthState {
  phoneInput,
  otpVerification,
  loading,
  success,
  error,
}

/// Phone verification data
class PhoneVerificationData {
  final String phoneNumber;
  final String countryCode;
  final bool isValid;

  const PhoneVerificationData({
    required this.phoneNumber,
    this.countryCode = AuthConstants.defaultCountryCode,
    this.isValid = false,
  });

  static const PhoneVerificationData empty = PhoneVerificationData(
    phoneNumber: '',
    countryCode: AuthConstants.defaultCountryCode,
    isValid: false,
  );
}

/// OTP verification data
class OtpVerificationData {
  final String otp;
  final bool isValid;
  final bool isComplete;

  const OtpVerificationData({
    required this.otp,
    this.isValid = false,
    this.isComplete = false,
  });

  static const OtpVerificationData empty = OtpVerificationData(
    otp: '',
    isValid: false,
    isComplete: false,
  );
}

/// Auth messages
class AuthMessages {
  static const String enterPhoneTitle = 'Enter your phone number';
  static const String enterPhoneSubtitle = 'We\'ll send you a verification code';
  static const String enterOtpTitle = 'Enter the 6-digit code sent to your phone';
  static const String sendCodeButton = 'Send Verification Code';
  static const String verifyOtpButton = 'Verify OTP';
  static const String changePhoneButton = 'Change phone number';
  static const String phoneRequiredError = 'Please enter a phone number';
  static const String invalidOtpError = 'Invalid OTP. Please enter 6 digits.';
  static const String codeSentMessage = 'Verification code sent (mocked). Enter any 6 digits.';
}
