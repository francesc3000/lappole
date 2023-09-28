import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lappole/src/user/sub_page/user_club/user_club_page.dart';
import 'package:lappole/src/user/sub_page/third_party/third_party_widget.dart';
import 'package:lappole/src/user/sub_page/watch/watch_widget.dart';
import 'package:lappole/src/user/user_basic_page.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_event.dart';
import 'package:lappole/src/user/bloc/user_state.dart';
import 'package:lappole/src/user/widget/user_activities_widget.dart';
import 'package:lappole/src/user/widget/user_data_widget.dart';
import 'package:lappole/src/utils/custom_flash.dart';

class UserMobilePage extends UserBasicPage {
  UserMobilePage(String title, {Key? key}) : super(title, key: key);

  @override
  Widget body(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
        bloc: userBloc,
        listenWhen: (previous, state) => state is UserStateError,
        listener: (context, state) {
          if (state is UserStateError) {
            CustomFlash(context).show(message: state.message);
          }
        },
        buildWhen: (context, state) {
          return state is UserIsLoginState || state is UserStateError;
        },
        builder: (BuildContext context, state) {
          bool loading = false;

          if (state is UserInitState) {
            loading = true;
            userBloc.add(InitUserDataEvent());
          } else if (state is UserIsLoginState) {
            loading = false;
          }

          if (loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () => userBloc.add(UserLogoutEvent()),
                        child: const Text('Salir'),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(flex: 2, child: UserDataWidget()),
              const Flexible(child: UserClubPage()),
              Flexible(child: WatchWidget()),
              Flexible(child: ThirdPartyWidget()),
              Expanded(flex: 2, child: UserActivitiesWidget()),
            ],
          );
        });
  }
}
