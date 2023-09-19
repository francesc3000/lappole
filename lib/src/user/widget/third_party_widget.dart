import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/model/third_party.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_event.dart';
import 'package:lappole/src/user/bloc/user_state.dart';
import 'package:lappole/src/user/widget/add_delete_widget.dart';

class ThirdPartyWidget extends StatelessWidget {
  final userBloc = Modular.get<UserBloc>();

  ThirdPartyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ThirdParty? thirdParty;
    return BlocBuilder<UserBloc, UserState>(
        bloc: userBloc,
        buildWhen: (context, state) {
          return state is UploadUserClubLoginState;
        },
        builder: (BuildContext context, state) {
          bool canThirdPartyLogin = false;

          if (state is UploadUserInitState) {
            thirdParty = state.user.thirdParty;
            canThirdPartyLogin = state.user.canThirdPartyLogin;
          } else if (state is UploadUserClubLoginState) {
            thirdParty = state.user.thirdParty;
            canThirdPartyLogin = state.user.canThirdPartyLogin;
          }
          return Visibility(
            visible: canThirdPartyLogin,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text('Health Connect'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: !thirdParty!.isLogin,
                        child: const Text('Registrar Health Connect'),
                      ),
                      Visibility(
                        visible: thirdParty!.isLogin,
                        child: const Text('Salir'),
                      ),
                      AddDeleteWidget(
                        isObjectNull: !thirdParty!.isLogin,
                        onTap: () => userBloc.add(LoginThirdPartyEvent()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
