import 'package:lappole/src/model/activity.dart';
import 'package:lappole/src/model/club.dart';
import 'package:lappole/src/model/third_party.dart';
import 'package:lappole/src/model/watch.dart';

class User {
  final String id;
  final String name;
  final String lastname;
  final String? photo;
  final DateTime birthdate;
  final String gender;
  final DateTime startDate;
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
}
