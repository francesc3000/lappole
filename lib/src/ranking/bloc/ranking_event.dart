abstract class RankingEvent {}

class RankingInitialDataEvent extends RankingEvent {
  @override
  String toString() => 'RankingInitialData Event';
}

class AddDistanceEvent extends RankingEvent {
  final String rankingId;

  AddDistanceEvent({required this.rankingId});

  @override
  String toString() => 'AddKm Event';
}

class Navigate2RankingDetailEvent extends RankingEvent {
  final String rankingId;

  Navigate2RankingDetailEvent(this.rankingId);
  @override
  String toString() => 'Navigate2RankingDetail Event';
}
