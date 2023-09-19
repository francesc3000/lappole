import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lappole/src/main/main_basic_page.dart';
import 'package:lappole/src/main/bloc/main_bloc.dart';
import 'package:lappole/src/main/bloc/main_state.dart';

class MainDesktopPage extends MainBasicPage {
  MainDesktopPage(String title, {Key? key}) : super(title, key: key);

  @override
  Widget body(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
        builder: (BuildContext context, state) {
      bool loading = false;

      if (state is MainInitState) {
        loading = true;
        // BlocProvider.of<AuthBloc>(context).add(AutoLogInEvent());
      } else if (state is UploadMainFields) {
        loading = false;
      }

      if (loading) {
        return const Center(child: CircularProgressIndicator());
      }

      return const Text('Pagina principal');
    });
  }
}
