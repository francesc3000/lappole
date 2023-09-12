abstract class UserState {}

class UserInitState extends UserState {
  @override
  String toString() => 'UserInitState';
}

class UploadUserFields extends UserState {
  UploadUserFields();

  @override
  String toString() => 'UploadUserFields State';
}

class UserStateError extends UserState {
  final String message;

  UserStateError(this.message);

  @override
  String toString() => 'UserStateError';
}
