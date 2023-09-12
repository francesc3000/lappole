import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lappole/src/feed/feed_page.dart';
import 'package:lappole/src/user/user_basic_page.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_event.dart';
import 'package:lappole/src/user/bloc/user_state.dart';

class UserDesktopPage extends UserBasicPage {
  UserDesktopPage(String title, {Key? key}) : super(title, key: key);

  @override
  Widget body(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
        builder: (BuildContext context, state) {
      bool loading = false;

      if (state is UserInitState) {
        loading = true;
        // BlocProvider.of<AuthBloc>(context).add(AutoLogInEvent());
      } else if (state is UploadUserFields) {
        loading = false;
      }

      // if (loading) {
      //   return const Center(child: CircularProgressIndicator());
      // }

      return Container(child: Text('Pagina usuario'));
    });
  }
}
