import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/basic_page.dart';
import 'package:lappole/src/user/sub_page/user_club/bloc/user_club_bloc.dart';

abstract class UserClubBasicPage extends BasicPage {
  final userClubBloc = Modular.get<UserClubBloc>();

  UserClubBasicPage({Key? key}) : super("", key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context, {String? title}) => null;

  @override
  Widget? bottomNavigationBar(BuildContext context) => null;

  @override
  Widget? floatingActionButton(BuildContext context) => null;

  @override
  FloatingActionButtonLocation? floatingActionButtonLocation(
          BuildContext context) =>
      null;
}
