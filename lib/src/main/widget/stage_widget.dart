import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:custom_signin_buttons/custom_signin_buttons.dart';
import 'package:flutter/material.dart';

class StageWidget extends StatefulWidget {
  final void Function()? onPressedUploadKm;
  final void Function()? onPressedNavigate;
  final bool hasPendingKm;

  const StageWidget(
      {this.onPressedUploadKm,
      this.onPressedNavigate,
      super.key,
      required this.hasPendingKm});

  @override
  State<StageWidget> createState() => _StageWidget();
}

class _StageWidget extends State<StageWidget> with TickerProviderStateMixin {
  int repe = 0;
  @override
  Widget build(BuildContext context) {
    List<AnimatedIconItem> icons = [];

    var animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 200),
    );

    if (widget.hasPendingKm) {
      icons.add(AnimatedIconItem(
        icon: const Icon(
          FontAwesomeIcons.personRunning,
          color: Colors.black,
        ),
        // backgroundColor: Colors.black,
        onPressed: () => widget.onPressedUploadKm,
      ));

      animationController.addListener(() {
        if (repe == 1) {
          animationController.reverse();
        }
        if (repe < 45) {
          animationController.repeat();
          repe++;
        } else {
          if (animationController.isCompleted) {
            animationController.forward();
            animationController.stop();
            repe = 0;
          }
        }
      });
    }

    icons.add(AnimatedIconItem(
      icon: const Icon(
        FontAwesomeIcons.rankingStar,
        color: Colors.black,
      ),
      onPressed: widget.onPressedNavigate,
    ));

    return Column(
      children: [
        AnimatedIconButton(
          animationController: animationController,
          visualDensity: VisualDensity(horizontal: 2.5, vertical: 1),
          splashRadius: 60,
          size: 40,
          splashColor: Colors.amberAccent,
          icons: icons,
        ),
        Visibility(
            visible: widget.hasPendingKm, child: Text('Subir KM pendientes')),
      ],
    );
  }
}
