import 'package:lappole/src/model/club.dart';

abstract class ClubDao {
  Future<Club?> getClubByPassword(String password);
}
