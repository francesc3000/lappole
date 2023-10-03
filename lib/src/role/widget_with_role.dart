import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/model/user.dart';
import 'package:lappole/src/model/user_role.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_state.dart';

class WidgetWithRole extends StatelessWidget {
  final userBloc = Modular.get<UserBloc>();

  final Widget child;
  final UserRole? allowedRoleLevel;
  final List<UserRole>? specificAllowedRoles;

  WidgetWithRole({
    Key? key,
    required this.child,
    this.allowedRoleLevel,
    this.specificAllowedRoles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
        bloc: userBloc,
        buildWhen: (previous, state) {
          return state is UserIsLoginState || state is UserIsLogoutState;
        },
        builder: (BuildContext context, state) {
          bool isAllowed = false;
          User? user;

          if (state is UserIsLoginState) {
            user = state.user;
          } else if (state is UserIsLogoutState) {}

          user ??= userBloc.user;

          if (specificAllowedRoles != null && user != null) {
            isAllowed = specificAllowedRoles!.contains(user.role);
          }
          if (allowedRoleLevel != null && user != null) {
            isAllowed = user.role.level >= allowedRoleLevel!.level;
          }

          if (isAllowed) {
            return child;
          }
          return Container();
        });
  }
}
