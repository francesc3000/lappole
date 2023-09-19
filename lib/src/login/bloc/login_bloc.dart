import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/auth/auth.dart';
import 'package:lappole/src/login/bloc/login_event.dart';
import 'package:lappole/src/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _auth = Modular.get<Auth>();

  LoginBloc() : super(LoginInitState()) {
    on<UserLoginEvent>(_userLoginEvent);
  }

  void _userLoginEvent(UserLoginEvent event, Emitter emit) async {
    try {
      _auth.userLogin('1234');
      emit(LoginSuccessState());
    } catch (error) {
      emit(error is LoginStateError
          ? LoginStateError(error.message)
          : LoginStateError('Algo fue mal!'));
    }
  }
}
