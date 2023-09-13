import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/model/watch.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_event.dart';
import 'package:lappole/src/user/widget/add_delete_widget.dart';

class WatchWidget extends StatelessWidget {
  final Watch? watch;

  const WatchWidget(this.watch, {super.key});

  @override
  Widget build(BuildContext context) {
    bool isWatchNull = watch == null ? true : false;
    final userBloc = Modular.get<UserBloc>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('Reloj'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                child: Text('No tienes ningun reloj emparejado'),
                visible: isWatchNull,
              ),
              Visibility(
                child: Column(
                  children: [
                    Text('Nombre: ${watch?.name ?? ''}'),
                  ],
                ),
                visible: !isWatchNull,
              ),
              AddDeleteWidget(
                isObjectNull: isWatchNull,
                onTap: () => userBloc.add(AddDeleteWatchEvent()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
