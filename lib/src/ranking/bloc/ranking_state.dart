abstract class RankingState {}

class RankingInitState extends RankingState {
  @override
  String toString() => 'RankingInitState';
}

class RankingStateError extends RankingState {
  final String message;

  RankingStateError(this.message);

  @override
  String toString() => 'RankingStateError';
}
