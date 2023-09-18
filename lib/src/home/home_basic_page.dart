import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lappole/src/basic_page.dart';
import 'package:lappole/src/home/bloc/home_bloc.dart';
import 'package:lappole/src/home/bloc/home_event.dart';

abstract class HomeBasicPage extends BasicPage implements Disposable {
  final controller = NotchBottomBarController(index: 0);
  final homeBloc = Modular.get<HomeBloc>();

  HomeBasicPage(String title, {Key? key})
      : super(title, key: key, safeArea: true, extendBody: true);

  @override
  Widget? bottomNavigationBar(BuildContext context) {
    return AnimatedNotchBottomBar(
      notchBottomBarController: controller,
      bottomBarItems: const [
        BottomBarItem(
          inActiveItem: Icon(
            FontAwesomeIcons.rankingStar,
            color: Colors.green,
          ),
          activeItem: Icon(
            FontAwesomeIcons.rankingStar,
            color: Colors.greenAccent,
          ),
          itemLabel: 'Carrera',
        ),
        BottomBarItem(
          inActiveItem: Icon(
            FontAwesomeIcons.trophy,
            color: Colors.green,
          ),
          activeItem: Icon(
            FontAwesomeIcons.trophy,
            color: Colors.greenAccent,
          ),
          itemLabel: 'Ranking',
        ),
        // BottomBarItem(
        //   inActiveItem: Icon(
        //     FontAwesomeIcons.squareRss,
        //     color: Colors.green,
        //   ),
        //   activeItem: Icon(
        //     FontAwesomeIcons.squareRss,
        //     color: Colors.greenAccent,
        //   ),
        //   itemLabel: 'Noticias',
        // ),
        BottomBarItem(
          inActiveItem: Icon(
            FontAwesomeIcons.solidUser,
            color: Colors.green,
          ),
          activeItem: Icon(
            FontAwesomeIcons.solidUser,
            color: Colors.greenAccent,
          ),
          itemLabel: 'Usuario',
        ),
      ],
      onTap: (int index) {
        homeBloc.add(ChangeTabEvent(index));
      },
    );
  }

  @override
  Widget? floatingActionButton(BuildContext context) => null;

  @override
  FloatingActionButtonLocation? floatingActionButtonLocation(
          BuildContext context) =>
      null;

  @override
  void dispose() {
    controller.dispose();
  }
}
