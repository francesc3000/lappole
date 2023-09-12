import 'package:lappole/src/model/club.dart';
import 'package:lappole/src/model/watch.dart';

class User {
  final String name;
  final String lastname;
  Club? club;
  Watch? watch;

  User(this.name, this.lastname);

  bool get hasClub => club == null ? false : true;
}
