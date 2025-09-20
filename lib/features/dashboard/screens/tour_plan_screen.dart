import 'package:flutter/material.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';

class TourPlanScreen extends StatelessWidget {
  const TourPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(t.tourPlan)),
      body: Center(child: Text(t.comingSoon(t.tourPlan))),
    );
  }
}
