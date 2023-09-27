import 'package:flutter/material.dart';

abstract class BasicPage extends StatelessWidget {
  final String title;
  final bool extendBody;

  const BasicPage(this.title, {Key? key, this.extendBody = false})
      : super(key: key);

  PreferredSizeWidget? appBar(BuildContext context, {String? title});
  Widget body(BuildContext context);
  Widget? floatingActionButton(BuildContext context);
  FloatingActionButtonLocation? floatingActionButtonLocation(
      BuildContext context);
  Widget? bottomNavigationBar(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, title: title),
        body: body(context),
        extendBody: extendBody,
        floatingActionButton: floatingActionButton(context),
        floatingActionButtonLocation: floatingActionButtonLocation(context),
        bottomNavigationBar: bottomNavigationBar(context),
      ),
    );
  }
}
