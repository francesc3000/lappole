class Activity {
  final String id;
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  double? distance;
  String? observation;

  Activity(
      {required this.id,
      required this.name,
      required this.startDate,
      required this.endDate,
      required this.distance,
      this.observation});

  bool get hasObservation => observation == null ? false : true;

  bool get startEndDateNotEqual => startDate.compareTo(endDate) != 0;
}
