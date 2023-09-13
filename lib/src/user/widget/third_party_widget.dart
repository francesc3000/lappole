import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_event.dart';
import 'package:lappole/src/user/widget/add_delete_widget.dart';

class ThirdPartyWidget extends StatelessWidget {
  final bool isLogin;

  const ThirdPartyWidget(this.isLogin, {super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = Modular.get<UserBloc>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('Strava'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                child: Text('Emparejar cuenta Strava'),
                visible: !isLogin,
              ),
              Visibility(
                child: Text('Emparejado'),
                visible: isLogin,
              ),
              AddDeleteWidget(
                isObjectNull: !isLogin,
                onTap: () => userBloc.add(LoginStravaEvent()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
