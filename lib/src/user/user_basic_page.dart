import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/basic_page.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';

abstract class UserBasicPage extends BasicPage {
  final userBloc = Modular.get<UserBloc>();

  UserBasicPage(
    String title, {
    Key? key,
  }) : super(title, key: key);

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
