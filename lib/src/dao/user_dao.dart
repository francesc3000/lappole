import 'package:lappole/src/model/user.dart';

abstract class UserDao {
  Future<User> getUserData(String userId);
}
