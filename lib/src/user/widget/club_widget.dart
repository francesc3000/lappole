import 'package:flutter/material.dart';
import 'package:lappole/src/model/club.dart';

class ClubWidget extends StatelessWidget {
  final Club? club;

  const ClubWidget(this.club, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('Club'),
          Visibility(
            child: Text('No estas en un club'),
            visible: club == null,
          ),
          Visibility(
            child: Column(children: [
              Text('Nombre: ${club!.name}'),
            ]),
            visible: club != null,
          ),
        ],
      ),
    );
  }
}
