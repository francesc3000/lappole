abstract class LoginState {}

class LoginInitState extends LoginState {
  @override
  String toString() => 'LoginInitState';
}

class LoginSuccessState extends LoginState {
  @override
  String toString() => 'LoginSuccess State';
}

class LoginStateError extends LoginState {
  final String message;

  LoginStateError(this.message);

  @override
  String toString() => 'LoginStateError';
}
