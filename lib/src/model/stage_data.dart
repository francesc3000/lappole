class StageData {
  final DateTime startDate;
  final DateTime endDate;
  double _distance = 0;

  StageData({required this.startDate, required this.endDate});

  double get distance => _distance;

  void addDistance(double distance) => _distance += distance;
}
