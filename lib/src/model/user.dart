import 'package:lappole/src/model/activity.dart';
import 'package:lappole/src/model/club.dart';
import 'package:lappole/src/model/third_party.dart';
import 'package:lappole/src/model/user_role.dart';
import 'package:lappole/src/model/watch.dart';

class User {
  final String id;
  final String name;
  final String lastname;
  final String? photo;
  final DateTime birthdate;
  final String gender;
  final DateTime startDate;
  final UserRole role;
  Club? club;
  Watch? watch;
  List<Activity>? activities;
  late ThirdParty thirdParty;

  User({
    required this.id,
    required this.name,
    required this.lastname,
    required this.birthdate,
    required this.gender,
    required this.startDate,
    required this.role,
    this.photo,
    this.club,
    this.watch,
    this.activities,
  }) {
    thirdParty = ThirdParty();
  }

  bool get hasClub => club == null ? false : true;

  bool get canAddWatch {
    if (club != null && thirdParty.isLogin == false) {
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

  bool get hasActivities4Upload => pendingDistance4Upload >= 0;

  double get pendingDistance4Upload {
    double pendingDistance = 0;

    if (activities != null) {
      for (var activity in activities!) {
        if (!activity.isUploaded && activity.isValid) {
          pendingDistance += activity.distance;
        }
      }
    }

    return pendingDistance;
  }

  bool get isManager => role.level >= UserRole.manager.level;

  void markActivitiesAsUploaded() {
    activities?.forEach((activity) {
      if (!activity.isUploaded && activity.isValid) {
        activity.markAsUploaded();
      }
    });
  }
}
