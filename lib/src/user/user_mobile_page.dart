import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lappole/src/model/user.dart';
import 'package:lappole/src/user/widget/club_widget.dart';
import 'package:lappole/src/user/user_basic_page.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_event.dart';
import 'package:lappole/src/user/bloc/user_state.dart';
import 'package:lappole/src/user/widget/third_party_widget.dart';
import 'package:lappole/src/user/widget/user_activities_widget.dart';
import 'package:lappole/src/user/widget/user_data_widget.dart';
import 'package:lappole/src/user/widget/watch_widget.dart';

class UserMobilePage extends UserBasicPage {
  UserMobilePage(String title, {Key? key}) : super(title, key: key);

  @override
  Widget body(BuildContext context) {
    User? user;
    return BlocBuilder<UserBloc, UserState>(
        bloc: userBloc,
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
            user = state.user;
          } else if (state is UserStateError) {}

          if (loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Flexible(flex: 1, child: UserDataWidget()),
                ClubWidget(),
                WatchWidget(),
                ThirdPartyWidget(),
                Flexible(flex: 1, child: UserActivitiesWidget()),
              ],
            ),
          );
        });
  }
}
