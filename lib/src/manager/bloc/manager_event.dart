abstract class ManagerEvent {}

class ManagerInitialDataEvent extends ManagerEvent {
  @override
  String toString() => 'ManagerInitialData Event';
}

class AddDistanceEvent extends ManagerEvent {
  final String managerId;

  AddDistanceEvent({required this.managerId});

  @override
  String toString() => 'AddKm Event';
}

class Navigate2ManagerDetailEvent extends ManagerEvent {
  final String managerId;

  Navigate2ManagerDetailEvent(this.managerId);
  @override
  String toString() => 'Navigate2ManagerDetail Event';
}
