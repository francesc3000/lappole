import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/model/club.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_event.dart';
import 'package:lappole/src/user/bloc/user_state.dart';
import 'package:lappole/src/user/widget/add_delete_widget.dart';

class ClubWidget extends StatelessWidget {
  final userBloc = Modular.get<UserBloc>();

  ClubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Club? club;
    return BlocBuilder<UserBloc, UserState>(
        bloc: userBloc,
        buildWhen: (context, state) {
          return state is UploadUserClubLoginState;
        },
        builder: (BuildContext context, state) {
          if (state is UploadUserInitState) {
            club = state.user.club;
          } else if (state is UploadUserClubLoginState) {
            club = state.user.club;
          }

          bool isClubNull = club == null ? true : false;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text('Club'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 6,
                      child: Visibility(
                        visible: isClubNull,
                        child: TextField(
                          decoration: const InputDecoration(
                              hintText: 'Ingesa password del Club'),
                          onChanged: (value) =>
                              userBloc.add(ClubPasswordChangeEvent(value)),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 6,
                      child: Visibility(
                        visible: !isClubNull,
                        child: Column(children: [
                          Text('Nombre: ${club?.name ?? ''}'),
                        ]),
                      ),
                    ),
                    AddDeleteWidget(
                      isObjectNull: isClubNull,
                      onTap: () => userBloc.add(AddDeleteClubEvent()),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
