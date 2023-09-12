abstract class MainEvent {}

class MainEventEmpty extends MainEvent {
  @override
  String toString() => 'Empty Event';
}

class MainInitialDataEvent extends MainEvent {
  @override
  String toString() => 'MainInitialData Event';
}
