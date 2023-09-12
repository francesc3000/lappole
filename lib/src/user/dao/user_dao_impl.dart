import 'package:lappole/src/dao/user_dao.dart';
import 'package:lappole/src/model/club.dart';
import 'package:lappole/src/model/user.dart';

class UserDaoImpl extends UserDao {
  @override
  Future<User> getUserData(String userId) {
    User user = User('Francesc', 'Muñoz Romero BBDD');
    user.club = Club('1234', 'Mejor Equipo');
    return Future.value(user);
  }
}
