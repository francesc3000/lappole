import 'package:lappole/src/model/activity.dart';

abstract class ActivityDao {
  Future<List<Activity>> getWatchActivities();
  Future<List<Activity>> getThirtPartyActivities();
}
