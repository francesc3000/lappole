abstract class UserEvent {}

class UserEventEmpty extends UserEvent {
  @override
  String toString() => 'Empty Event';
}

class ChangeTabEvent extends UserEvent {
  int index;

  ChangeTabEvent(this.index);
  @override
  String toString() => 'ChangeTabEvent Event';
}
