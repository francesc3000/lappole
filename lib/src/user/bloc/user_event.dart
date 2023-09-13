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

class AddDeleteWatchEvent extends UserEvent {
  @override
  String toString() => 'AddDeleteWatch Event';
}

class LoginStravaEvent extends UserEvent {
  @override
  String toString() => 'LoginStrava Event';
}

class ClubPasswordChangeEvent extends UserEvent {
  final String clubPassword;

  ClubPasswordChangeEvent(this.clubPassword);
  @override
  String toString() => 'ClubPasswordChange Event';
}
