abstract class ManagerState {}

class ManagerInitState extends ManagerState {
  @override
  String toString() => 'ManagerInitState';
}

class ManagerStateError extends ManagerState {
  final String message;

  ManagerStateError(this.message);

  @override
  String toString() => 'ManagerStateError';
}
