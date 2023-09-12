import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lappole/src/feed/feed_page.dart';
import 'package:lappole/src/user/user_basic_page.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_event.dart';
import 'package:lappole/src/user/bloc/user_state.dart';

class UserMobilePage extends UserBasicPage {
  UserMobilePage(String title, {Key? key}) : super(title, key: key);

  @override
  Widget body(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
        bloc: userBloc,
        builder: (BuildContext context, state) {
          bool loading = false;

          if (state is UserInitState) {
            loading = true;
          } else if (state is UploadUserFields) {
            loading = false;
          }

          // if (loading) {
          //   return const Center(child: CircularProgressIndicator());
          // }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Text('Nombre: Francesc Muñoz'),
                Text(''),
              ],
            ),
          );
        });
  }
}
