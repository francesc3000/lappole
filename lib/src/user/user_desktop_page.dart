import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lappole/src/user/sub_page/user_club/user_club_page.dart';
import 'package:lappole/src/user/user_basic_page.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_event.dart';
import 'package:lappole/src/user/bloc/user_state.dart';
import 'package:lappole/src/user/widget/input_distance_widget.dart';
import 'package:lappole/src/user/widget/user_activities_widget.dart';
import 'package:lappole/src/user/widget/user_data_widget.dart';
import 'package:lappole/src/utils/custom_flash.dart';

class UserDesktopPage extends UserBasicPage {
  UserDesktopPage(String title, {Key? key}) : super(title, key: key);

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

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                title: UserDataWidget(),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () => userBloc.add(UserLogoutEvent()),
                        child: const Text('Salir'),
                      ),
                    ],
                  ),
                ],
              ),
              SliverPersistentHeader(delegate: UserClubPage()),
              SliverPersistentHeader(
                delegate: InputDistanceWidget(),
              ),
              UserActivitiesWidget(),
            ],
          );
        });
  }
}
