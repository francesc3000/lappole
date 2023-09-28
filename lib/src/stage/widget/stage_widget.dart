import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lappole/src/model/stage.dart';
import 'package:lappole/src/stage/bloc/stage_bloc.dart';
import 'package:lappole/src/stage/bloc/stage_event.dart';

class StageWidget extends StatefulWidget {
  final double pendingDistance;
  final MainAxisAlignment stageAxisAlignment;
  final Stage stage;
  final stageBloc = Modular.get<StageBloc>();

  StageWidget(
      {super.key,
      required this.pendingDistance,
      required this.stageAxisAlignment,
      required this.stage});

  @override
  State<StageWidget> createState() => _StageWidget();
}

class _StageWidget extends State<StageWidget> with TickerProviderStateMixin {
  int repe = 0;
  MainAxisAlignment? _mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    List<AnimatedIconItem> icons = [];
    _mainAxisAlignment ??= widget.stageAxisAlignment;
    Stage stage = widget.stage;
    StageBloc stageBloc = widget.stageBloc;
    double pendingDistance = widget.pendingDistance;

    bool hasPendingDistance = pendingDistance > 0 ? true : false;

    var animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 200),
    );

    if (stage.isCurrent && hasPendingDistance) {
      icons.add(AnimatedIconItem(
        icon: Icon(
          FontAwesomeIcons.personRunning,
          color: stage.isCurrent ? Colors.green : Colors.black,
        ),
        // backgroundColor: Colors.black,
        onPressed: () => stage.isCurrent
            ? stageBloc.add(AddDistanceEvent(stageId: stage.id))
            : null,
      ));

      // animationController.addListener(() {
      //   if (repe == 1) {
      //     animationController.reverse();
      //   }
      //   if (repe < 10) {
      //     animationController.repeat();
      //     repe++;
      //   } else {
      //     if (animationController.isCompleted) {
      //       animationController.forward();
      //       animationController.stop();
      //       repe = 0;
      //     }
      //   }
      // });
    }

    icons.add(AnimatedIconItem(
      icon: Icon(
        FontAwesomeIcons.rankingStar,
        color: stage.isCurrent
            ? Colors.green
            : stage.hasData
                ? Colors.black
                : Colors.black45,
      ),
      onPressed: () => stageBloc.add(Navigate2StageDetailEvent(stage.id)),
    ));

    return Row(
      mainAxisAlignment: _mainAxisAlignment!,
      children: [
        Column(
          children: [
            Text(stage.name),
            stage.hasData
                ? Text(
                    '${stage.stageData!.distance.toStringAsFixed(2)}/${stage.distance}')
                : Text('${stage.distance}'),
            AnimatedIconButton(
              animationController: animationController,
              visualDensity: const VisualDensity(horizontal: 2.5, vertical: 1),
              splashRadius: 60,
              size: 40,
              splashColor: Colors.amberAccent,
              icons: icons,
            ),
            Visibility(
                visible: widget.stage.isCurrent && hasPendingDistance,
                child: Text('Subir ${pendingDistance.toStringAsFixed(2)} KM')),
          ],
        ),
      ],
    );
  }
}
