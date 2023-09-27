import 'package:lappole/src/dao/activity_dao.dart';
import 'package:lappole/src/model/activity.dart';

class ActivityDaoImpl extends ActivityDao {
  @override
  Future<List<Activity>> getThirtPartyActivities() {
    return Future.value([
      Activity(
          id: '443',
          name: 'Actividad 3',
          startDate: DateTime.now(),
          endDate: DateTime.now(),
          distance: 33)
    ]);
  }

  @override
  Future<List<Activity>> getWatchActivities() {
    return Future.value([
      Activity(
          id: '443',
          name: 'Actividad 3',
          startDate: DateTime.now(),
          endDate: DateTime.now(),
          distance: 33)
    ]);
  }
}
