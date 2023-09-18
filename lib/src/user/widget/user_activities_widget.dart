import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lappole/src/model/activity.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_state.dart';

class UserActivitiesWidget extends StatelessWidget {
  final userBloc = Modular.get<UserBloc>();

  UserActivitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Activity>? activities;

    return BlocBuilder<UserBloc, UserState>(
        bloc: userBloc,
        buildWhen: (context, state) {
          return state is UploadUserActivitiesState;
        },
        builder: (BuildContext context, state) {
          bool hasActivities = false;

          if (state is UploadUserInitState) {
            activities = state.user.activities;
            hasActivities = state.user.hasActivities;
          } else if (state is UploadUserActivitiesState) {
            activities = state.activities;
            hasActivities = state.hasActivities;
          }

          return Visibility(
            visible: hasActivities,
            child: ListView.builder(
                itemCount: activities!.length,
                itemBuilder: (context, index) {
                  Activity activity = activities![index];
                  return ExpansionTileCard(
                    leading: Icon(
                      index == 2
                          ? FontAwesomeIcons.xmark
                          : FontAwesomeIcons.arrowUp,
                      color: index == 2 ? Colors.red : Colors.green,
                    ),
                    title: Text(activity.name),
                    children: [
                      Text('${activity.distance} km'),
                      Visibility(
                        visible: activity.hasObservation,
                        child: Text(activity.observation ?? ''),
                      ),
                    ],
                  );
                }),
          );
        });
  }
}
