abstract class MainEvent{
}

class MainEventEmpty extends MainEvent{
  @override
  String toString() => 'Empty Event';
}

class ChangeTabEvent extends MainEvent {
  int index;

  ChangeTabEvent(this.index);
  @override
  String toString() => 'ChangeTabEvent Event';
}