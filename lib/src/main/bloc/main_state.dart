import 'package:lappole/src/model/stage.dart';

abstract class MainState {}

class MainInitState extends MainState {
  @override
  String toString() => 'MainInitState';
}

class UploadMainFields extends MainState {
  final List<Stage>? stages;
  final int currentStageIndex;

  UploadMainFields({this.stages, this.currentStageIndex = 0});

  @override
  String toString() => 'UploadMainFields State';
}

class MainStateError extends MainState {
  final String message;

  MainStateError(this.message);

  @override
  String toString() => 'MainStateError';
}
