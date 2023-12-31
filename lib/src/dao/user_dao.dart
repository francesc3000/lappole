import 'package:lappole/src/model/user.dart';

abstract class UserDao {
  Future<User> getUserData(String userId);
  Future joinClub(String userId, String clubPassword);
  Future disjoinClub(String userId, String clubPassword);
}
