
class Trip {
  final String id;
  final String name;
  final String destination;
  final DateTime startDate;
  final DateTime endDate;
  final String notes;
  final String? imageUrl;

  const Trip({
    required this.id,
    required this.name,
    required this.destination,
    required this.startDate,
    required this.endDate,
    this.notes = '',
    this.imageUrl,
  });

  bool get isUpcoming => endDate.isAfter(DateTime.now());
}
