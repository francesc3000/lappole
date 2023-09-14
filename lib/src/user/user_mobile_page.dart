import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lappole/src/feed/feed_page.dart';
import 'package:lappole/src/model/club.dart';
import 'package:lappole/src/model/user.dart';
import 'package:lappole/src/user/widget/club_widget.dart';
import 'package:lappole/src/user/user_basic_page.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_event.dart';
import 'package:lappole/src/user/bloc/user_state.dart';
import 'package:lappole/src/user/widget/third_party_widget.dart';
import 'package:lappole/src/user/widget/user_activities_widget.dart';
import 'package:lappole/src/user/widget/watch_widget.dart';

class UserMobilePage extends UserBasicPage {
  UserMobilePage(String title, {Key? key}) : super(title, key: key);

  @override
  Widget body(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
        bloc: userBloc,
        builder: (BuildContext context, state) {
          bool loading = false;
          late User user;

          if (state is UserInitState) {
            loading = true;
            userBloc.add(InitUserDataEvent());
          } else if (state is UserIsLoginState) {
            loading = false;
            user = state.user;
          } else if (state is UploadUserFields) {
            user = state.user!;
          }

          if (loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Nombre: ${user.name} ${user.lastname}'),
                ClubWidget(user.club),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Visibility(
                        visible: user.canAddWatch,
                        child: WatchWidget(user.watch),
                      ),
                      Visibility(
                        visible: user.canThirdPartyLogin,
                        child: ThirdPartyWidget(user.isStravaLogin),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Visibility(
                    visible: user.hasActivities,
                    child: UserActivitiesWidget(),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
