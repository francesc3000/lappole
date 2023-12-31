import 'package:flutter/material.dart';
import 'package:lappole/src/model/user.dart';
import 'package:lappole/src/stage/widget/stage_widget.dart';
import 'package:lappole/src/model/stage.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

enum StagePositionType {
  left,
  center,
  right,
}

enum DirectionSense {
  left,
  right,
  down,
}

class StagePosition {
  StagePositionType? _position;
  DirectionSense? _direction;

  void nextPosition() {
    if (_position == null) {
      _position = StagePositionType.left;
      _direction = DirectionSense.right;
    } else {
      switch (_position) {
        case StagePositionType.center:
          if (_direction == DirectionSense.right) {
            _position = StagePositionType.right;
          } else {
            _position = StagePositionType.left;
          }
          break;
        case StagePositionType.left:
          _position = StagePositionType.center;
          _direction = DirectionSense.right;
          break;
        case StagePositionType.right:
          _position = StagePositionType.center;
          _direction = DirectionSense.left;
          break;
        default:
        // position = StagePositionType.center;
      }
    }
  }

  MainAxisAlignment get position {
    return _position == StagePositionType.left
        ? MainAxisAlignment.start
        : _position == StagePositionType.center
            ? MainAxisAlignment.center
            : MainAxisAlignment.end;
  }
}

class StageController extends StatelessWidget {
  final scrollDirection = Axis.vertical;
  final StagePosition stagePosition = StagePosition();

  final User? user;
  final List<Stage>? stages;

  StageController({required this.user, required this.stages, super.key});

  @override
  Widget build(BuildContext context) {
    AutoScrollController controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);

    return CustomScrollView(
      slivers: [
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          delegate: SliverChildBuilderDelegate(
            childCount: stages?.length ?? 0,
            (BuildContext context, int index) {
              // return ListView.builder(
              //   scrollDirection: scrollDirection,
              //   controller: controller,
              //   shrinkWrap: true,
              //   itemCount: stages?.length ?? 0,
              //   itemBuilder: (context, index) {
              Stage stage = stages![index];
              stagePosition.nextPosition();

              if (stage.isCurrent) {
                controller.scrollToIndex(index,
                    preferPosition: AutoScrollPosition.middle);
              }

              return AutoScrollTag(
                key: ValueKey(index),
                controller: controller,
                index: index,
                child: SizedBox(
                  height: (MediaQuery.of(context).size.height / 3) - 40,
                  child: Column(
                    children: [
                      // Visibility(
                      //     visible:
                      //         index % 4 == 0 || index % 4 == 3 ? true : false,
                      //     child: RotatedBox(
                      //         quarterTurns:
                      //             index % 4 == 0 || index % 4 == 3 ? 1 : 1,
                      //         child: const Icon(FontAwesomeIcons.shoePrints))),
                      Row(
                        children: [
                          // Visibility(
                          //     visible: index % 4 == 1 || index % 4 == 3
                          //         ? true
                          //         : false,
                          //     child: RotatedBox(
                          //         quarterTurns: index % 4 == 1 ? 4 : 2,
                          //         child:
                          //             const Icon(FontAwesomeIcons.shoePrints))),
                          StageWidget(
                            stage: stage,
                            pendingDistance: user?.pendingDistance4Upload ?? 0,
                            stageAxisAlignment: MainAxisAlignment.center,
                          ),
                          // Visibility(
                          //     visible: index % 4 == 0 || index % 4 == 2
                          //         ? true
                          //         : false,
                          //     child: RotatedBox(
                          //         quarterTurns:
                          //             index % 4 == 0 || index % 4 == 2 ? 4 : 4,
                          //         child:
                          //             const Icon(FontAwesomeIcons.shoePrints))),
                        ],
                      ),
                      // Visibility(
                      //     visible:
                      //         index % 4 == 1 || index % 4 == 2 ? true : false,
                      //     child: const RotatedBox(
                      //         quarterTurns: 1,
                      //         child: Icon(FontAwesomeIcons.shoePrints))),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
