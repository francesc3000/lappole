abstract class UserClubEvent {}

class UserClubInitialDataEvent extends UserClubEvent {
  @override
  String toString() => 'UserClubInitialData Event';
}

class AddDeleteClubEvent extends UserClubEvent {
  @override
  String toString() => 'AddDeleteClub Event';
}

class AddDeleteWatchEvent extends UserClubEvent {
  @override
  String toString() => 'AddDeleteWatch Event';
}

class LoginThirdPartyEvent extends UserClubEvent {
  @override
  String toString() => 'LoginThirdParty Event';
}

class ClubPasswordChangeEvent extends UserClubEvent {
  final String clubPassword;

  ClubPasswordChangeEvent(this.clubPassword);
  @override
  String toString() => 'ClubPasswordChange Event';
}
