import 'package:flutter/material.dart';
import 'package:tourist_safety_app/core/constants/app_constants.dart';

/// Shared card widget with consistent styling
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow>? shadows;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.shadows,
    this.borderRadius,
    this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      padding: padding ?? AppPadding.md,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppConstants.backgroundPrimary,
        borderRadius: borderRadius ?? AppRadius.lg,
        boxShadow: shadows ?? AppShadows.medium,
      ),
      child: child,
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? AppRadius.lg,
        child: card,
      );
    }

    return card;
  }
}

/// Shared elevated button with consistent styling
class AppElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;

  const AppElevatedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppConstants.primaryColor,
        foregroundColor: textColor ?? Colors.white,
        padding: AppPadding.verticalMd,
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.md,
        ),
        elevation: 0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: AppConstants.iconSizeMd),
            const SizedBox(width: AppConstants.spacingSm),
          ],
          if (isLoading)
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          else
            Text(text, style: AppTextStyles.button),
        ],
      ),
    );
  }
}

/// Shared outlined button with consistent styling
class AppOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? icon;
  final Color? borderColor;
  final Color? textColor;

  const AppOutlinedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.borderColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: borderColor ?? AppConstants.borderMedium),
        foregroundColor: textColor ?? AppConstants.textPrimary,
        padding: AppPadding.verticalMd,
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.md,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: AppConstants.iconSizeMd),
            const SizedBox(width: AppConstants.spacingSm),
          ],
          if (isLoading)
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          else
            Text(text, style: AppTextStyles.button),
        ],
      ),
    );
  }
}

/// Shared status badge widget
class AppStatusBadge extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  const AppStatusBadge({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });

  static const EdgeInsets verticalSm = EdgeInsets.symmetric(vertical: AppConstants.spacingSm);
  static const EdgeInsets verticalMd = EdgeInsets.symmetric(vertical: AppConstants.spacingMd);
  static const EdgeInsets verticalLg = EdgeInsets.symmetric(vertical: AppConstants.spacingLg);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.verticalSm,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: AppRadius.sm,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// Shared loading indicator
class AppLoadingIndicator extends StatelessWidget {
  final double size;
  final Color? color;

  const AppLoadingIndicator({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? AppConstants.primaryColor,
        ),
      ),
    );
  }
}

/// Shared offline banner
class AppOfflineBanner extends StatelessWidget {
  final String message;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;

  const AppOfflineBanner({
    super.key,
    this.message = 'No internet connection. Displaying cached data.',
    this.backgroundColor,
    this.textColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.md,
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFFFFF3CD),
        borderRadius: AppRadius.md,
      ),
      child: Row(
        children: [
          Icon(
            icon ?? Icons.wifi_off,
            color: textColor ?? const Color(0xFFB7791F),
          ),
          const SizedBox(width: AppConstants.spacingSm),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: textColor ?? const Color(0xFFB7791F),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Shared skeleton loader
class AppSkeletonLoader extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadius? borderRadius;

  const AppSkeletonLoader({
    super.key,
    this.height = 16,
    this.width = double.infinity,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppConstants.borderLight,
        borderRadius: borderRadius ?? AppRadius.sm,
      ),
    );
  }
}
