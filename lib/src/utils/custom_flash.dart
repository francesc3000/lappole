import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

class CustomFlash {
  final BuildContext context;

  CustomFlash(this.context);

  void show(
      {required String message,
      required IconData iconData,
      required Color color}) {
    showModalFlash(
      context: context,
      builder: (context, controller) {
        return Align(
          alignment: AlignmentDirectional.centerStart,
          child: FadeTransition(
            opacity: controller.controller.drive(Tween(begin: 0.5, end: 1.0)),
            child: Flash(
              controller: controller,
              // behavior: FlashBehavior.floating,
              position: FlashPosition.bottom,
              // boxShadows: kElevationToShadow[4],
              // backgroundColor: Colors.blue,
              // backgroundGradient: const LinearGradient(
              //   colors: [Colors.blue, Colors.blueAccent],
              // ),
              dismissDirections: const [FlashDismissDirection.startToEnd],
              forwardAnimationCurve: Curves.easeInCirc,
              reverseAnimationCurve: Curves.bounceIn,
              child: FlashBar(
                icon: Icon(iconData),
                content: Text(message),
                controller: controller,
                backgroundColor: color,
                forwardAnimationCurve: Curves.easeInCirc,
                reverseAnimationCurve: Curves.bounceIn,
              ),
            ),
          ),
        );
      },
    );
  }
}
