abstract class HomeState {}

class HomeInitState extends HomeState {
  @override
  String toString() => 'HomeInitState';
}

class ChangeTabSuccessState extends HomeState {
  final int index;
  ChangeTabSuccessState(this.index);

  @override
  String toString() => 'ChangeTabSuccess State';
}

class HomeStateError extends HomeState {
  final String message;

  HomeStateError(this.message);

  @override
  String toString() => 'HomeStateError';
}
