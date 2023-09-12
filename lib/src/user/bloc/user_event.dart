abstract class UserEvent {}

class UserEventEmpty extends UserEvent {
  @override
  String toString() => 'Empty Event';
}

class InitUserDataEvent extends UserEvent {
  InitUserDataEvent();
  @override
  String toString() => 'InitUserData Event';
}
