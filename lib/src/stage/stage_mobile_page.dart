import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lappole/src/model/user.dart';
import 'package:lappole/src/stage/stage_basic_page.dart';
import 'package:lappole/src/stage/bloc/stage_bloc.dart';
import 'package:lappole/src/stage/bloc/stage_event.dart';
import 'package:lappole/src/stage/bloc/stage_state.dart';
import 'package:lappole/src/stage/controller/stage_controller.dart';
import 'package:lappole/src/model/stage.dart';
import 'package:lappole/src/utils/custom_flash.dart';

class StageMobilePage extends StageBasicPage {
  StageMobilePage(String title, {Key? key}) : super(title, key: key);

  @override
  Widget body(BuildContext context) {
    return BlocConsumer<StageBloc, StageState>(
        bloc: stageBloc,
        listenWhen: (previous, state) =>
            state is Navigate2StageDetailState ||
            state is DistanceUploadedSuccessState ||
            state is StageStateError,
        listener: (context, state) {
          if (state is Navigate2StageDetailState) {
            Modular.to.pushNamed('/stageDetail');
          } else if (state is DistanceUploadedSuccessState) {
            CustomFlash(context).show(
                message: state.message,
                iconData: FontAwesomeIcons.cloud,
                color: Colors.green);
          } else if (state is StageStateError) {
            CustomFlash(context).show(message: state.message);
          }
        },
        buildWhen: (previous, state) => state is UploadStageFields,
        builder: (BuildContext context, state) {
          bool loading = false;
          List<Stage>? stages;
          User? user;

          if (state is StageInitState) {
            loading = true;
            stageBloc.add(StageInitialDataEvent());
          } else if (state is UploadStageFields) {
            stages = state.stages;
            user = state.user;
          }

          if (loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return StageController(user: user, stages: stages);
        });
  }
}
