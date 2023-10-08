import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/model/third_party.dart';
import 'package:lappole/src/user/sub_page/user_club/bloc/user_club_bloc.dart';
import 'package:lappole/src/user/sub_page/user_club/bloc/user_club_event.dart';
import 'package:lappole/src/user/sub_page/user_club/bloc/user_club_state.dart';
import 'package:lappole/src/user/widget/add_delete_widget.dart';

class ThirdPartyWidget extends StatelessWidget {
  final userClubBloc = Modular.get<UserClubBloc>();

  ThirdPartyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ThirdParty? thirdParty;
    return BlocBuilder<UserClubBloc, UserClubState>(
        bloc: userClubBloc,
        buildWhen: (context, state) {
          return state is UploadUserClubLoginState;
        },
        builder: (BuildContext context, state) {
          bool canThirdPartyLogin = false;

          if (state is UploadUserClubLoginState) {
            thirdParty = state.user.thirdParty;
            canThirdPartyLogin = state.user.canThirdPartyLogin;
          }
          return Visibility(
            visible: canThirdPartyLogin,
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
                      onTap: () => userClubBloc.add(LoginThirdPartyEvent()),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
