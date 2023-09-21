import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:custom_signin_buttons/custom_signin_buttons.dart';
import 'package:flutter/material.dart';

class StageWidget extends StatefulWidget {
  final void Function()? onPressed;

  const StageWidget({this.onPressed, super.key});

  @override
  State<StageWidget> createState() => _StageWidget();
}

class _StageWidget extends State<StageWidget> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 200),
    );

    return AnimatedIconButton(
      animationController: animationController,
      visualDensity: VisualDensity(horizontal: 2.5, vertical: 1),
      splashRadius: 60,
      size: 40,
      splashColor: Colors.amberAccent,
      icons: [
        AnimatedIconItem(
          icon: const Icon(
            FontAwesomeIcons.plus,
            color: Colors.black,
          ),
          // backgroundColor: Colors.black,
          tooltip: 'Subir KM pendientes',
          // onPressed: () => animationController.forward(),
        ),
        AnimatedIconItem(
          icon: const Icon(
            FontAwesomeIcons.personRunning,
            color: Colors.black,
          ),
          onPressed: widget.onPressed,
        ),
      ],
    );
  }
}
