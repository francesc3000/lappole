abstract class UserEvent {}

class UserEventEmpty extends UserEvent {
  @override
  String toString() => 'Empty Event';
}

class InitUserDataEvent extends UserEvent {
  @override
  String toString() => 'InitUserData Event';
}

class AddDeleteClubEvent extends UserEvent {
  @override
  String toString() => 'AddDeleteClub Event';
}
