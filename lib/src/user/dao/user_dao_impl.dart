import 'package:lappole/src/dao/user_dao.dart';
import 'package:lappole/src/model/activity.dart';
import 'package:lappole/src/model/club.dart';
import 'package:lappole/src/model/user.dart';
import 'package:lappole/src/model/watch.dart';

class UserDaoImpl extends UserDao {
  @override
  Future<User> getUserData(String userId) {
    User user = User(id: '111', name: 'Francesc', lastname: 'Muñoz Romero');
    user.club = Club(id: '1234', name: 'Mejor Equipo');
    user.watch = Watch(id: '5678', name: 'Garmin 1');
    user.activities = [
      Activity(id: '441', name: 'Actividad 1', distance: 10),
      Activity(id: '442', name: 'Actividad 2', distance: 20),
      Activity(
          id: '443',
          name: 'Actividad 3',
          distance: 30,
          observation: 'Se solapa con la Actividad 2'),
    ];
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
