abstract class UserEvent {}

class InitUserDataEvent extends UserEvent {
  @override
  String toString() => 'InitUserData Event';
}
