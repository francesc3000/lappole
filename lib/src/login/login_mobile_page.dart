import 'package:custom_signin_buttons/custom_signin_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/login/bloc/login_event.dart';
import 'package:lappole/src/login/login_basic_page.dart';
import 'package:lappole/src/login/bloc/login_bloc.dart';
import 'package:lappole/src/login/bloc/login_state.dart';

class LoginMobilePage extends LoginBasicPage {
  LoginMobilePage({Key? key}) : super('', key: key);

  @override
  Widget body(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
        bloc: loginBloc,
        listener: (context, state) {
          if (state is LoginSuccessState) {
            var history = Modular.to.navigateHistory;

            Modular.to.navigate(history.first.name);
          }
        },
        buildWhen: (previous, state) {
          return state is LoginSuccessState;
        },
        builder: (BuildContext context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SignInButton(
                onPressed: () => loginBloc.add(UserLoginEvent()),
                button: Button.Google,
              ),
              const SizedBox(
                height: 30,
              ),
              SignInButton(
                onPressed: () => loginBloc.add(UserLoginEvent()),
                button: Button.Apple,
              ),
            ]),
          );
        });
  }
}
