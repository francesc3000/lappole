import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/login/bloc/login_event.dart';
import 'package:lappole/src/login/login_basic_page.dart';
import 'package:lappole/src/login/bloc/login_bloc.dart';
import 'package:lappole/src/login/bloc/login_state.dart';
import 'package:sign_in_button/sign_in_button.dart';

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
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Visibility(
                visible: Platform.isAndroid || Platform.isWindows,
                child: SignInButton(
                  Buttons.google,
                  onPressed: () => loginBloc.add(UserLoginEvent()),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Visibility(
                visible: Platform.isIOS || Platform.isMacOS,
                child: SignInButton(
                  Buttons.apple,
                  onPressed: () => loginBloc.add(UserLoginEvent()),
                ),
              ),
            ]),
          );
        });
  }
}
