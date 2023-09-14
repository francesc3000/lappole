class Activity {
  final String id;
  final String name;
  double? distance;
  String? observation;

  Activity(
      {required this.id, required this.name, this.distance, this.observation});

  bool get hasObservation => observation == null ? false : true;
}
