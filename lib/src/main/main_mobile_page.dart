import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lappole/src/feed/feed_page.dart';
import 'package:lappole/src/main/main_basic_page.dart';
import 'package:lappole/src/main/bloc/main_bloc.dart';
import 'package:lappole/src/main/bloc/main_event.dart';
import 'package:lappole/src/main/bloc/main_state.dart';

class MainMobilePage extends MainBasicPage {
  MainMobilePage(String title, {Key? key}) : super(title, key: key);

  @override
  Widget body(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
        bloc: mainBloc,
        builder: (BuildContext context, state) {
          bool loading = false;

          if (state is MainInitState) {
            loading = true;
          } else if (state is UploadMainFields) {
            loading = false;
          }

          // if (loading) {
          //   return const Center(child: CircularProgressIndicator());
          // }

          return Center(
            child: IconButton(
              icon: FaIcon(FontAwesomeIcons.personRunning),
              onPressed: null,
            ),
          );
        });
  }
}
