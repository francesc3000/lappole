import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lappole/src/main/main_basic_page.dart';
import 'package:lappole/src/main/bloc/main_bloc.dart';
import 'package:lappole/src/main/bloc/main_event.dart';
import 'package:lappole/src/main/bloc/main_state.dart';
import 'package:lappole/src/main/widget/stage_widget.dart';
import 'package:lappole/src/model/stage.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class MainMobilePage extends MainBasicPage {
  final scrollDirection = Axis.vertical;
  MainMobilePage(String title, {Key? key}) : super(title, key: key);

  @override
  Widget body(BuildContext context) {
    AutoScrollController controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);

    return BlocBuilder<MainBloc, MainState>(
        bloc: mainBloc,
        buildWhen: (previous, state) => state is UploadMainFields,
        builder: (BuildContext context, state) {
          bool loading = false;
          List<Stage>? stages;

          if (state is MainInitState) {
            loading = true;
            mainBloc.add(MainInitialDataEvent());
          } else if (state is UploadMainFields) {
            stages = state.stages;
            controller.scrollToIndex(state.currentStageIndex,
                preferPosition: AutoScrollPosition.middle);
          }

          if (loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: ListView.builder(
              scrollDirection: scrollDirection,
              controller: controller,
              shrinkWrap: true,
              // physics: const PageScrollPhysics(),
              itemCount: stages?.length ?? 0,
              itemBuilder: (context, index) {
                Stage event = stages![index];
                return AutoScrollTag(
                  key: ValueKey(index),
                  controller: controller,
                  index: index,
                  child: SizedBox(
                    height: (MediaQuery.of(context).size.height / 3) - 40,
                    child: Column(
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(event.name),
                        event.hasData
                            ? Text(event.stageData!.counter.round().toString())
                            : Container(),
                        StageWidget(
                          onPressedUploadKm: () => event.hasData
                              ? mainBloc.add(AddKmEvent(event.id))
                              : null,
                          onPressedNavigate: null,
                          hasPendingKm: false,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
