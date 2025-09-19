enum AlertType { enter, exit }

class ZoneAlert {
  final String zoneId;
  final String zoneName;
  final AlertType type;
  final DateTime timestamp;

  ZoneAlert({
    required this.zoneId,
    required this.zoneName,
    required this.type,
    required this.timestamp,
  });
}
