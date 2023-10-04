abstract class HomeState {}

class HomeInitState extends HomeState {
  @override
  String toString() => 'HomeInitState';
}

class VersionDataState extends HomeState {
  final String version;
  VersionDataState(this.version);

  @override
  String toString() => 'VersionData State';
}

class ChangeTabSuccessState extends HomeState {
  final String navigate;
  final bool hasClub;
  final bool isManager;
  ChangeTabSuccessState(this.navigate, this.hasClub, this.isManager);

  @override
  String toString() => 'ChangeTabSuccess State';
}

class HomeStateError extends HomeState {
  final String message;

  HomeStateError(this.message);

  @override
  String toString() => 'HomeStateError';
}
