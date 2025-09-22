import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onRetry;

  const ErrorView({
    super.key,
    required this.title,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, color: Color(0xFFD93F34), size: 48),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFF6B7280)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyView extends StatelessWidget {
  final String title;
  final String message;
  final Widget? action;

  const EmptyView({
    super.key,
    required this.title,
    required this.message,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.inbox_outlined, color: Color(0xFF6B7280), size: 48),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFF6B7280)),
            ),
            if (action != null) ...[
              const SizedBox(height: 16),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}

class DashboardSkeleton extends StatelessWidget {
  const DashboardSkeleton({super.key});

  Widget _skeletonBox({double height = 16, double width = double.infinity, BorderRadius? radius}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: const Color(0xFFE5E7EB),
        borderRadius: radius ?? BorderRadius.circular(8),
      ),
    );
  }

  Widget _card(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 4))],
      ),
      padding: const EdgeInsets.all(16),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _card(Row(
          children: [
            const CircleAvatar(radius: 28, backgroundColor: Color(0xFFE5E7EB)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _skeletonBox(height: 16, width: 120),
                  const SizedBox(height: 8),
                  _skeletonBox(height: 14, width: 160),
                  const SizedBox(height: 8),
                  _skeletonBox(height: 14, width: 100),
                ],
              ),
            ),
            const SizedBox(width: 12),
            _skeletonBox(height: 72, width: 72, radius: BorderRadius.circular(8)),
          ],
        )),
        const SizedBox(height: 16),
        _card(Row(
          children: [
            _skeletonBox(height: 28, width: 28, radius: BorderRadius.circular(14)),
            const SizedBox(width: 12),
            Expanded(child: _skeletonBox(height: 16, width: 200)),
          ],
        )),
        const SizedBox(height: 16),
        _card(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _skeletonBox(height: 16, width: 100),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.95,
              ),
              itemCount: 4,
              itemBuilder: (_, __) => _skeletonBox(height: 60),
            ),
          ],
        )),
      ],
    );
  }
}
