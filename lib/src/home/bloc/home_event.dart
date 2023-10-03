abstract class HomeEvent {}

class HomeInitDataEvent extends HomeEvent {
  @override
  String toString() => 'HomeInitData Event';
}

class ChangeTabEvent extends HomeEvent {
  String navigate;

  ChangeTabEvent(this.navigate);
  @override
  String toString() => 'ChangeTabEvent Event';
}
