import 'package:lappole/src/model/activity.dart';
import 'package:lappole/src/model/user.dart';

abstract class UserState {}

class UserInitState extends UserState {
  @override
  String toString() => 'UserInitState';
}

class UserIsLoginState extends UserState {
  final User user;
  UserIsLoginState(this.user);

  @override
  String toString() => 'UserIsLogin State';
}

class UploadUserInitState extends UserState {
  final User user;
  UploadUserInitState(this.user);

  @override
  String toString() => 'UploadUserInit State';
}

class UserIsLogoutState extends UserState {
  get user => null;

  @override
  String toString() => 'UserIsLogout State';
}

class UploadUserActivitiesState extends UserState {
  final List<Activity>? activities;
  final bool hasActivities;

  UploadUserActivitiesState(this.activities, this.hasActivities);
  @override
  String toString() => 'UploadUserActivities state';
}

class UserStateError extends UserState {
  final String message;

  UserStateError(this.message);

  @override
  String toString() => 'UserStateError';
}
