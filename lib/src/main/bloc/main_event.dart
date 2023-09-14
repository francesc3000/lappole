abstract class MainEvent {}

class MainEventEmpty extends MainEvent {
  @override
  String toString() => 'Empty Event';
}

class MainInitialDataEvent extends MainEvent {
  @override
  String toString() => 'MainInitialData Event';
}

class AddKmEvent extends MainEvent {
  final String eventId;

  AddKmEvent(this.eventId);
  @override
  String toString() => 'AddKm Event';
}
