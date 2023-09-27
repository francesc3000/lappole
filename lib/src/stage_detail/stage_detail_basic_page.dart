import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/basic_page.dart';
import 'package:lappole/src/stage/bloc/stage_bloc.dart';

abstract class StageDetailBasicPage extends BasicPage implements Disposable {
  final stageBloc = Modular.get<StageBloc>();

  StageDetailBasicPage(String title, {Key? key})
      : super(title, key: key, extendBody: true);

  @override
  PreferredSizeWidget? appBar(BuildContext context, {String? title}) =>
      AppBar();

  @override
  Widget? bottomNavigationBar(BuildContext context) => null;

  @override
  Widget? floatingActionButton(BuildContext context) => null;

  @override
  FloatingActionButtonLocation? floatingActionButtonLocation(
          BuildContext context) =>
      null;

  @override
  void dispose() {}
}
