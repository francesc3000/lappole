import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/basic_page.dart';
import 'package:lappole/src/main/bloc/main_bloc.dart';

abstract class MainBasicPage extends BasicPage {
  final mainBloc = Modular.get<MainBloc>();

  MainBasicPage(String title, {Key? key})
      : super(title, key: key, hasSafeArea: true);

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
