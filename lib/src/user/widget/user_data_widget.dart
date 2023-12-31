import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:lappole/src/model/user.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_state.dart';

class UserDataWidget extends StatelessWidget {
  final userBloc = Modular.get<UserBloc>();

  UserDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    User? user;
    return BlocConsumer<UserBloc, UserState>(
        bloc: userBloc,
        listenWhen: (previous, current) => true,
        listener: (context, state) {},
        buildWhen: (previous, state) {
          return state is UploadUserInitState;
        },
        builder: (BuildContext context, state) {
          if (state is UploadUserInitState) {
            user = state.user;
          }

          return Container(
            margin: const EdgeInsets.all(8.0),
            child: ExpansionTileCard(
              // leading: ImageNetwork().build(user!.photo),
              title: Text('${user!.name} ${user!.lastname}'),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Fecha Nacimiento: ${DateFormat.yMd().format(user!.birthdate)}'),
                    Text('Sexo: ${user!.gender}'),
                  ],
                )
              ],
              // trailing: const Icon(FontAwesomeIcons.pencil),
            ),
          );
        });
  }
}
