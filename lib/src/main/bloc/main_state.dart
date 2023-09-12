import 'package:lappole/src/model/event.dart';

abstract class MainState {}

class MainInitState extends MainState {
  @override
  String toString() => 'MainInitState';
}

class UploadMainFields extends MainState {
  final List<Event>? events;

  UploadMainFields({this.events});

  @override
  String toString() => 'UploadMainFields State';
}

class MainStateError extends MainState {
  final String message;

  MainStateError(this.message);

  @override
  String toString() => 'MainStateError';
}
