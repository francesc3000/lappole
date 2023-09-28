abstract class StageEvent {}

class StageInitialDataEvent extends StageEvent {
  @override
  String toString() => 'StageInitialData Event';
}

class AddDistanceEvent extends StageEvent {
  final String stageId;

  AddDistanceEvent({required this.stageId});

  @override
  String toString() => 'AddKm Event';
}

class Navigate2StageDetailEvent extends StageEvent {
  final String stageId;

  Navigate2StageDetailEvent(this.stageId);
  @override
  String toString() => 'Navigate2StageDetail Event';
}

class StageonBackButtonEvent extends StageEvent {
  @override
  String toString() => 'StageonBackButton Event';
}
