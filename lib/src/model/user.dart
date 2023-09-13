import 'package:lappole/src/model/club.dart';
import 'package:lappole/src/model/watch.dart';

class User {
  final String id;
  final String name;
  final String lastname;
  Club? club;
  Watch? watch;
  bool isStravaLogin = false;

  User(this.id, this.name, this.lastname);

  bool get hasClub => club == null ? false : true;

  bool get canAddWatch {
    if (club != null && isStravaLogin == false) {
      return true;
    }

    return false;
  }

  bool get hasWatch => watch == null ? false : true;

  bool get canThirdPartyLogin {
    if (club != null && hasWatch == false) {
      return true;
    }

    return false;
  }
}
