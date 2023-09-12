import 'package:lappole/src/dao/user_dao.dart';
import 'package:lappole/src/model/club.dart';
import 'package:lappole/src/model/user.dart';
import 'package:lappole/src/model/watch.dart';

class UserDaoImpl extends UserDao {
  @override
  Future<User> getUserData(String userId) {
    User user = User('Francesc', 'Muñoz Romero BBDD');
    user.club = Club('1234', 'Mejor Equipo');
    user.watch = Watch('5678', 'Garmin 1');
    return Future.value(user);
  }
}
