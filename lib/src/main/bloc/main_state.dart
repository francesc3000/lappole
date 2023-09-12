abstract class MainState {}

class MainInitState extends MainState {
  @override
  String toString() => 'MainInitState';
}

class UploadMainFields extends MainState {
  UploadMainFields();

  @override
  String toString() => 'UploadMainFields State';
}

class MainStateError extends MainState {
  final String message;

  MainStateError(this.message);

  @override
  String toString() => 'MainStateError';
}
