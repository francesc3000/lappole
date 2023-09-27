import 'package:lappole/src/model/stage.dart';
import 'package:lappole/src/model/user.dart';

abstract class StageState {}

class StageInitState extends StageState {
  @override
  String toString() => 'StageInitState';
}

class UploadStageFields extends StageState {
  final List<Stage>? stages;
  final User? user;

  UploadStageFields({required this.stages, required this.user});

  @override
  String toString() => 'UploadStageFields State';
}

class Navigate2StageDetailState extends StageState {
  @override
  String toString() => 'Navigate2StageDetail State';
}

class DistanceUploadedSuccessState extends StageState {
  final String message;

  DistanceUploadedSuccessState(this.message);

  @override
  String toString() => 'DistanceUploadedSuccess State';
}

class StageStateError extends StageState {
  final String message;

  StageStateError(this.message);

  @override
  String toString() => 'StageStateError';
}
