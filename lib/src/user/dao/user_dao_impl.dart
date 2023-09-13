import 'package:lappole/src/dao/user_dao.dart';
import 'package:lappole/src/model/club.dart';
import 'package:lappole/src/model/user.dart';
import 'package:lappole/src/model/watch.dart';

class UserDaoImpl extends UserDao {
  @override
  Future<User> getUserData(String userId) {
    User user = User('111', 'Francesc', 'Muñoz Romero BBDD');
    // user.club = Club('1234', 'Mejor Equipo');
    // user.watch = Watch('5678', 'Garmin 1');
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
