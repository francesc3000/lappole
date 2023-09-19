abstract class LoginEvent {}

class UserLoginEvent extends LoginEvent {
  @override
  String toString() => 'UserLogin Event';
}
