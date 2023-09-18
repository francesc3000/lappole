import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/model/watch.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_event.dart';
import 'package:lappole/src/user/bloc/user_state.dart';
import 'package:lappole/src/user/widget/add_delete_widget.dart';

class WatchWidget extends StatelessWidget {
  final userBloc = Modular.get<UserBloc>();

  WatchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Watch? watch;

    return BlocBuilder<UserBloc, UserState>(
        bloc: userBloc,
        buildWhen: (context, state) {
          return state is UploadUserClubLoginState;
        },
        builder: (BuildContext context, state) {
          bool canAddWatch = false;

          if (state is UploadUserInitState) {
            watch = state.user.watch;
            canAddWatch = state.user.canAddWatch;
          } else if (state is UploadUserClubLoginState) {
            watch = state.user.watch;
            canAddWatch = state.user.canAddWatch;
          }

          bool isWatchNull = watch == null ? true : false;

          return Visibility(
            visible: canAddWatch,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Reloj'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: isWatchNull,
                        child: Text('No tienes ningun reloj emparejado'),
                      ),
                      Visibility(
                        visible: !isWatchNull,
                        child: Column(
                          children: [
                            Text('Nombre: ${watch?.name ?? ''}'),
                          ],
                        ),
                      ),
                      AddDeleteWidget(
                        isObjectNull: isWatchNull,
                        onTap: () => userBloc.add(AddDeleteWatchEvent()),
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
