import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lappole/src/model/activity.dart';
import 'package:lappole/src/model/user.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_state.dart';

class UserActivitiesWidget extends StatelessWidget {
  final userBloc = Modular.get<UserBloc>();

  UserActivitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    User? user;
    return BlocBuilder<UserBloc, UserState>(
        bloc: userBloc,
        builder: (BuildContext context, state) {
          if (state is UserIsLoginState) {
            user = state.user;
          } else if (state is UploadUserFields) {
            user = state.user;
          }

          if (user?.hasActivities ?? false) {
            return ListView.builder(
                itemCount: user!.activities!.length,
                itemBuilder: (context, index) {
                  Activity activity = user!.activities![index];
                  return ExpansionTileCard(
                    title: Text(activity.name),
                    trailing: Icon(
                      index == 2
                          ? FontAwesomeIcons.xmark
                          : FontAwesomeIcons.arrowUp,
                      color: index == 2 ? Colors.red : Colors.green,
                    ),
                    children: [
                      Text('${activity.distance} km'),
                      Visibility(
                          visible: activity.hasObservation,
                          child: Text(activity.observation ?? ''))
                    ],
                  );
                });
          } else {
            return Container();
          }
        });
  }
}
