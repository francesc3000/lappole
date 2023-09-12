import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddDeleteWidget extends StatelessWidget {
  final Function? onTap;
  final bool isObjectNull;

  const AddDeleteWidget({super.key, this.onTap, required this.isObjectNull});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => {},
      icon: isObjectNull
          ? const FaIcon(FontAwesomeIcons.circlePlus)
          : const FaIcon(FontAwesomeIcons.solidCircleXmark),
      color: isObjectNull ? Colors.green : Colors.red,
    );
  }
}
