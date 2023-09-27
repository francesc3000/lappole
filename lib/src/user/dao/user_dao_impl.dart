import 'package:lappole/src/dao/user_dao.dart';
import 'package:lappole/src/model/activity.dart';
import 'package:lappole/src/model/club.dart';
import 'package:lappole/src/model/user.dart';
import 'package:lappole/src/model/watch.dart';

class UserDaoImpl extends UserDao {
  @override
  Future<User> getUserData(String userId) {
    User user = User(
        id: '111',
        name: 'Francesc',
        lastname: 'Muñoz Romero',
        photo:
            'https://lh3.googleusercontent.com/a/ACg8ocLhONyA0cuIi4L9VB_21T3Wa-7wPXNWj4AnsFP4GZXy-QZf=s288-c-no',
        birthdate: DateTime.now(),
        gender: 'M',
        startDate: DateTime.now());
    user.club = Club(id: '1234', name: 'Mejor Equipo');
    user.watch = Watch(id: '5678', name: 'Garmin 1');

    Activity activity1 = Activity(
        id: '441',
        name: 'Actividad 1',
        startDate: DateTime.now().subtract(const Duration(days: 6)),
        endDate: DateTime.now().subtract(const Duration(days: 5)),
        distance: 11);

    Activity activity2 = Activity(
        id: '442',
        name: 'Actividad 2',
        startDate: DateTime.now().subtract(const Duration(days: 3)),
        endDate: DateTime.now(),
        distance: 22);

    activity1.markAsUploaded();
    // activity2.markAsUploaded();

    user.activities = [activity1, activity2];
    return Future.value(user);
  }

  @override
  Future joinClub(String userId, String clubPassword) {
    // TODO: implement joinClub
    return Future.value(null);
  }

  @override
  Future disjoinClub(String userId, String clubPassword) {
    // TODO: implement disjoinClub
    return Future.value(null);
  }
}
