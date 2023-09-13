import 'package:lappole/src/model/activity.dart';
import 'package:lappole/src/model/club.dart';
import 'package:lappole/src/model/watch.dart';

class User {
  final String id;
  final String name;
  final String lastname;
  Club? club;
  Watch? watch;
  bool isStravaLogin;
  List<Activity>? activities;

  User({
    required this.id,
    required this.name,
    required this.lastname,
    this.club,
    this.watch,
    this.isStravaLogin = false,
    this.activities,
  });

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

  bool get hasActivities => activities == null ? false : true;
}
