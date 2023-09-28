import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lappole/src/stage/bloc/stage_bloc.dart';
import 'package:lappole/src/stage/bloc/stage_event.dart';
import 'package:lappole/src/stage/bloc/stage_state.dart';
import 'package:lappole/src/stage_detail/stage_detail_basic_page.dart';

class StageDetailMobilePage extends StageDetailBasicPage {
  StageDetailMobilePage(String title, {Key? key}) : super(title, key: key);

  Future<bool> _onWillPop() async {
    stageBloc.add(StageonBackButtonEvent());
    return true;
  }

  @override
  Widget body(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: BlocBuilder<StageBloc, StageState>(
          bloc: stageBloc,
          builder: (BuildContext context, state) {
            return const Text("Esto es el detalle de la etapa");
          }),
    );
  }
}
