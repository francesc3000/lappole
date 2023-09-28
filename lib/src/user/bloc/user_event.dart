abstract class UserEvent {}

class InitUserDataEvent extends UserEvent {
  @override
  String toString() => 'InitUserData Event';
}

class UserLogoutEvent extends UserEvent {
  @override
  String toString() => 'UserLogout Event';
}
