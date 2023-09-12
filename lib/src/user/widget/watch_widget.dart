import 'package:flutter/material.dart';
import 'package:lappole/src/model/watch.dart';

class WatchWidget extends StatelessWidget {
  final Watch? watch;

  const WatchWidget(this.watch, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('Reloj'),
          Visibility(
            child: Text('No tienes ningun reloj emparejado'),
            visible: watch == null,
          ),
          Visibility(
            child: Column(children: [
              Text('Nombre: ${watch!.name}'),
            ]),
            visible: watch != null,
          ),
        ],
      ),
    );
  }
}
