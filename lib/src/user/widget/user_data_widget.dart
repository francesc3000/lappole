import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lappole/src/model/user.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_state.dart';
import 'package:lappole/src/widget/image_network.dart';

class UserDataWidget extends StatelessWidget {
  final userBloc = Modular.get<UserBloc>();

  UserDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    User? user;
    return BlocBuilder<UserBloc, UserState>(
        bloc: userBloc,
        buildWhen: (context, state) {
          return state is UserIsLoginState;
        },
        builder: (BuildContext context, state) {
          if (state is UploadUserInitState) {
            user = state.user;
          } else if (state is UploadUserInitState) {
            user = state.user;
          }

          return Container(
            margin: const EdgeInsets.all(8.0),
            child: Card(
              child: ExpansionTileCard(
                leading: ImageNetwork().build(user!.photo),
                title: Text('${user!.name} ${user!.lastname}'),
                // trailing: const Icon(FontAwesomeIcons.pencil),
              ),
            ),
          );
        });
  }
}
