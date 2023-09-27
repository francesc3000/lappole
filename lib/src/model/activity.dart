class Activity {
  final String id;
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  double distance;
  String? observation;
  bool _isUploaded = false;

  Activity(
      {required this.id,
      required this.name,
      required this.startDate,
      required this.endDate,
      required this.distance,
      this.observation});

  bool get isValid => observation == null ? true : false;

  void markAsUploaded() => _isUploaded = true;

  bool get isUploaded => _isUploaded && isValid;
}
