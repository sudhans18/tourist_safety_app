import 'package:flutter/material.dart';
import 'package:tourist_safety_app/features/dashboard/constants/dashboard_constants.dart';

/// Reusable slide-in animation widget
class SlideInAnimation extends StatelessWidget {
  final bool show;
  final Widget child;
  final Duration duration;
  final Offset offset;

  const SlideInAnimation({
    super.key,
    required this.show,
    required this.child,
    this.duration = DashboardConstants.mediumAnimation,
    this.offset = const Offset(0, 0.1),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: show ? 1 : 0,
      duration: duration,
      curve: Curves.easeOut,
      child: AnimatedSlide(
        offset: show ? Offset.zero : offset,
        duration: duration,
        curve: Curves.easeOut,
        child: child,
      ),
    );
  }
}

/// Reusable shake animation widget
class ShakeAnimation extends StatelessWidget {
  final AnimationController controller;
  final Widget child;
  final double intensity;

  const ShakeAnimation({
    super.key,
    required this.controller,
    required this.child,
    this.intensity = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final animation = Tween<double>(
      begin: 0.0,
      end: intensity,
    ).chain(
      CurveTween(curve: Curves.elasticIn),
    ).animate(controller);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        return Transform.translate(
          offset: Offset(animation.value, 0),
          child: child,
        );
      },
    );
  }
}

/// Reusable pulse animation widget
class PulseAnimation extends StatelessWidget {
  final AnimationController controller;
  final Widget child;
  final double minScale;
  final double maxScale;

  const PulseAnimation({
    super.key,
    required this.controller,
    required this.child,
    this.minScale = 1.0,
    this.maxScale = 1.04,
  });

  @override
  Widget build(BuildContext context) {
    final animation = Tween<double>(
      begin: minScale,
      end: maxScale,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );

    return ScaleTransition(
      scale: animation,
      child: child,
    );
  }
}

/// Reusable fade and slide animation for headers
class FadeSlideAnimation extends StatelessWidget {
  final Widget child;
  final bool animate;
  final Duration duration;
  final Offset slideOffset;

  const FadeSlideAnimation({
    super.key,
    required this.child,
    this.animate = true,
    this.duration = DashboardConstants.slowAnimation,
    this.slideOffset = const Offset(-0.1, 0),
  });

  @override
  Widget build(BuildContext context) {
    if (!animate) return child;

    return FadeTransition(
      opacity: CurvedAnimation(
        parent: ModalRoute.of(context)!.animation!,
        curve: Curves.easeOut,
      ),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: slideOffset,
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: ModalRoute.of(context)!.animation!,
            curve: Curves.easeOut,
          ),
        ),
        child: child,
      ),
    );
  }
}
