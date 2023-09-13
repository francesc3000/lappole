import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/model/club.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_event.dart';
import 'package:lappole/src/user/widget/add_delete_widget.dart';

class ClubWidget extends StatelessWidget {
  final Club? club;

  const ClubWidget(this.club, {super.key});

  @override
  Widget build(BuildContext context) {
    bool isClubNull = club == null ? true : false;
    final userBloc = Modular.get<UserBloc>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('Club'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 6,
                child: Visibility(
                  child: TextField(
                    decoration:
                        InputDecoration(hintText: 'Ingesa password del Club'),
                    onChanged: (value) =>
                        userBloc.add(ClubPasswordChangeEvent(value)),
                  ),
                  visible: isClubNull,
                ),
              ),
              Flexible(
                flex: 6,
                child: Visibility(
                  child: Column(children: [
                    Text('Nombre: ${club?.name ?? ''}'),
                  ]),
                  visible: !isClubNull,
                ),
              ),
              AddDeleteWidget(
                isObjectNull: isClubNull,
                onTap: () => userBloc.add(AddDeleteClubEvent()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
