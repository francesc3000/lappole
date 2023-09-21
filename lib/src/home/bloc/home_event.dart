abstract class HomeEvent {}

class HomeInitDataEvent extends HomeEvent {
  @override
  String toString() => 'HomeInitData Event';
}

class ChangeTabEvent extends HomeEvent {
  int index;

  ChangeTabEvent(this.index);
  @override
  String toString() => 'ChangeTabEvent Event';
}
