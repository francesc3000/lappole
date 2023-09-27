import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lappole/src/stage/stage_basic_page.dart';
import 'package:lappole/src/stage/bloc/stage_bloc.dart';
import 'package:lappole/src/stage/bloc/stage_state.dart';

class StageDesktopPage extends StageBasicPage {
  StageDesktopPage(String title, {Key? key}) : super(title, key: key);

  @override
  Widget body(BuildContext context) {
    return BlocBuilder<StageBloc, StageState>(
        builder: (BuildContext context, state) {
      bool loading = false;

      if (state is StageInitState) {
        loading = true;
        // BlocProvider.of<AuthBloc>(context).add(AutoLogInEvent());
      } else if (state is UploadStageFields) {
        loading = false;
      }

      if (loading) {
        return const Center(child: CircularProgressIndicator());
      }

      return const Text('Pagina principal');
    });
  }
}
