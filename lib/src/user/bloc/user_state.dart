import 'package:lappole/src/model/club.dart';
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

class UploadUserFields extends UserState {
  final User? user;
  UploadUserFields({this.user});

  @override
  String toString() => 'UploadUserFields State';
}

class UserStateError extends UserState {
  final String message;

  UserStateError(this.message);

  @override
  String toString() => 'UserStateError';
}
