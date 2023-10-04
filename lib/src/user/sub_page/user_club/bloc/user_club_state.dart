import 'package:lappole/src/model/user.dart';

abstract class UserClubState {}

class UserClubInitState extends UserClubState {
  @override
  String toString() => 'UserInitState';
}

class UserClubJoinSuccessState extends UserClubState {
  @override
  String toString() => 'UserClubJoinSuccess State';
}

class UserClubDisjoinSuccessState extends UserClubState {
  @override
  String toString() => 'UserClubDisjoinSuccess State';
}

class UploadUserClubLoginState extends UserClubState {
  final User user;

  UploadUserClubLoginState(this.user);
  @override
  String toString() => 'UploadUserClubLogin state';
}

class UserClubStateError extends UserClubState {
  final String message;

  UserClubStateError(this.message);

  @override
  String toString() => 'UserClubStateError';
}
