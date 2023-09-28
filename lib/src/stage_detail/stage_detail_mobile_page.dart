import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lappole/src/model/stage.dart';
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
          buildWhen: (previous, state) => state is Navigate2StageDetailState,
          builder: (BuildContext context, state) {
            late Stage stage;
            if (state is Navigate2StageDetailState) {
              stage = state.stage;
            }

            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(stage.name),
                  Text(
                      '${stage.stageData!.distance.toStringAsFixed(2)}/${stage.distance.toStringAsFixed(2)} Km')
                ],
              ),
            );
          }),
    );
  }
}
