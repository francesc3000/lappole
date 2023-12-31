import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/login/bloc/login_event.dart';
import 'package:lappole/src/login/login_basic_page.dart';
import 'package:lappole/src/login/bloc/login_bloc.dart';
import 'package:lappole/src/login/bloc/login_state.dart';

class LoginDesktopPage extends LoginBasicPage {
  LoginDesktopPage({Key? key}) : super('', key: key);

  @override
  Widget body(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
        bloc: loginBloc,
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Modular.to.pop();
          }
        },
        buildWhen: (previous, state) {
          return state is LoginSuccessState;
        },
        builder: (BuildContext context, state) {
          return ElevatedButton(
              onPressed: () => loginBloc.add(UserLoginEvent()),
              child: const Text('Registrame'));
        });
  }
}
