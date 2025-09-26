import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tourist_safety_app/features/auth/constants/auth_constants.dart';

/// Optimized phone input field widget
class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onChanged;

  const PhoneInputField({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.phone,
      style: const TextStyle(fontSize: AuthConstants.inputSize),
      onChanged: (_) => onChanged?.call(),
      decoration: InputDecoration(
        labelText: 'Phone Number',
        hintText: AuthConstants.phoneHint,
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AuthConstants.cardPadding,
            vertical: 14,
          ),
          child: Text(
            AuthConstants.defaultCountryCode,
            style: TextStyle(
              fontSize: AuthConstants.hintSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AuthConstants.cardPadding,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AuthConstants.cardBorderRadius),
          borderSide: const BorderSide(color: AuthConstants.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AuthConstants.cardBorderRadius),
          borderSide: const BorderSide(color: AuthConstants.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AuthConstants.cardBorderRadius),
          borderSide: const BorderSide(
            color: AuthConstants.focusBorderColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}

/// Optimized OTP input field widget
class OtpInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onChanged;

  const OtpInputField({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          AuthMessages.enterOtpTitle,
          style: TextStyle(color: AuthConstants.textSecondary),
        ),
        const SizedBox(height: AuthConstants.inputSpacing),

        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          maxLength: AuthConstants.otpLength,
          style: const TextStyle(
            fontSize: AuthConstants.inputSize,
            letterSpacing: 2,
          ),
          textAlign: TextAlign.center,
          onChanged: (_) => onChanged?.call(),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(AuthConstants.otpLength),
          ],
          decoration: InputDecoration(
            counterText: '',
            hintText: AuthConstants.otpHint,
            hintStyle: const TextStyle(
              color: Colors.grey,
              letterSpacing: 2,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: AuthConstants.cardPadding,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AuthConstants.cardBorderRadius),
              borderSide: const BorderSide(color: AuthConstants.borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AuthConstants.cardBorderRadius),
              borderSide: const BorderSide(color: AuthConstants.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AuthConstants.cardBorderRadius),
              borderSide: const BorderSide(
                color: AuthConstants.focusBorderColor,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Optimized auth header widget
class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: AuthConstants.titleSize,
            fontWeight: FontWeight.bold,
            color: AuthConstants.textPrimary,
          ),
        ),
        const SizedBox(height: AuthConstants.contentSpacing),

        Text(
          subtitle,
          style: const TextStyle(color: AuthConstants.textSecondary),
        ),
      ],
    );
  }
}

/// Optimized auth action buttons
class AuthActionButtons extends StatelessWidget {
  final bool isOtpMode;
  final bool isPhoneValid;
  final bool isOtpValid;
  final VoidCallback onPrimaryPressed;
  final VoidCallback onSecondaryPressed;

  const AuthActionButtons({
    super.key,
    required this.isOtpMode,
    required this.isPhoneValid,
    required this.isOtpValid,
    required this.onPrimaryPressed,
    required this.onSecondaryPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: (isOtpMode ? isOtpValid : isPhoneValid) ? onPrimaryPressed : null,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AuthConstants.cardBorderRadius),
            ),
          ),
          child: Text(
            isOtpMode ? AuthMessages.verifyOtpButton : AuthMessages.sendCodeButton,
            style: const TextStyle(
              fontSize: AuthConstants.inputSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        if (isOtpMode) ...[
          const SizedBox(height: AuthConstants.contentSpacing),

          TextButton(
            onPressed: onSecondaryPressed,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: const Text(
              AuthMessages.changePhoneButton,
              style: TextStyle(color: AuthConstants.textSecondary),
            ),
          ),
        ],
      ],
    );
  }
}
