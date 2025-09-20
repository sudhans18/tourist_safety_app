import 'package:flutter/material.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';

class FamilyScreen extends StatefulWidget {
  const FamilyScreen({Key? key}) : super(key: key);

  @override
  State<FamilyScreen> createState() => _FamilyScreenState();
}

class _FamilyScreenState extends State<FamilyScreen> {
  bool shareEnabled = true;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(t.familyTracking),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Master toggle card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 12,
                        offset: Offset(0, 4)),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.share_location, color: Color(0xFFD93F34)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(t.shareLocationVitals,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16)),
                          const SizedBox(height: 4),
                          Text(t.enableToShare,
                              style: const TextStyle(color: Color(0xFF6B7280))),
                        ],
                      ),
                    ),
                    Switch(
                      value: shareEnabled,
                      activeThumbColor: Colors.white,
                      activeTrackColor: const Color(0xFFD93F34),
                      onChanged: (v) => setState(() => shareEnabled = v),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // SOS info card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEEBEA),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.notifications_active, color: Color(0xFFD93F34)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(t.sosAlerts, style: const TextStyle(fontWeight: FontWeight.w700)),
                          const SizedBox(height: 6),
                          Text(t.sosAlertsDesc,
                              style: const TextStyle(color: Color(0xFF6B7280))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Text(t.sharingWith, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
              const SizedBox(height: 12),

              _memberTile('Sarah Miller', 'Mother',
                  status: 'Active', color: const Color(0xFF10B981)),
              const SizedBox(height: 10),
              _memberTile('John Miller', 'Father',
                  status: 'Active', color: const Color(0xFF10B981)),
              const SizedBox(height: 10),
              _memberTile('Emily Carter', 'Friend',
                  status: 'Paused',
                  color: const Color(0xFFF59E0B),
                  muted: true),

              const SizedBox(height: 24),
              // Revoke all sharing button
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFEEBEA),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD93F34),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(t.accessRevokedMsg)),
                        );
                      },
                      icon: const Icon(Icons.shield),
                      label: Text(t.revokeAllSharing),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      t.revokeAllSharingDesc,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Color(0xFF6B7280)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _memberTile(String name, String relation,
      {required String status, required Color color, bool muted = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
              color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 4))
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFF3F4F6),
          child: Text(name[0],
              style: const TextStyle(
                  color: Color(0xFF111827), fontWeight: FontWeight.w700)),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            const SizedBox(width: 6),
            Text(status, style: TextStyle(color: color)),
            const SizedBox(width: 12),
            Text(relation, style: const TextStyle(color: Color(0xFF6B7280))),
          ],
        ),
        trailing: Icon(muted ? Icons.volume_off : Icons.volume_up,
            color: const Color(0xFF9CA3AF)),
        onTap: () {},
      ),
    );
  }
}
