import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lappole/src/basic_page.dart';
import 'package:lappole/src/home/bloc/home_bloc.dart';
import 'package:lappole/src/home/bloc/home_event.dart';
import 'package:lappole/src/home/bloc/home_state.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

abstract class HomeBasicPage extends BasicPage implements Disposable {
  final String version;
  final homeBloc = Modular.get<HomeBloc>();

  HomeBasicPage(String title, this.version, {Key? key})
      : super(title, key: key, extendBody: true);

  @override
  PreferredSizeWidget? appBar(BuildContext context, {String? title}) {
    return AppBar(
      // backgroundColor: const Color.fromARGB(255, 140, 71, 153),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: const SizedBox(
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('assets/images/race/logoYoCorro.webp'),
          //   ),
          //   borderRadius: BorderRadius.all(Radius.circular(10)),
          // ),
          height: 50,
          width: 50,
        ),
      ),
      title: Text(title!),
      actions: [
        Center(child: Text(version)),
      ],
    );
  }

  @override
  Widget? bottomNavigationBar(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        bloc: homeBloc,
        buildWhen: (previous, state) {
          return state is ChangeTabSuccessState;
        },
        builder: (BuildContext context, state) {
          int currentIndex = 0;
          bool isManager = false;
          if (state is ChangeTabSuccessState) {
            isManager = state.isManager;

            switch (state.navigate) {
              case '/ranking':
                currentIndex = 1;
                break;
              case '/manager':
                currentIndex = 2;
                break;
              case '/user':
                if (isManager) {
                  currentIndex = 3;
                } else {
                  currentIndex = 2;
                }

                break;
              default:
                currentIndex = 0;
            }
          }

          List<SalomonBottomBarItem> items = [
            SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.route,
              ),
              title: const Text('Viaje'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.rankingStar,
              ),
              title: const Text('Ranking'),
            ),
          ];

          if (isManager) {
            items.add(
              SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.chartLine,
                ),
                title: const Text('Manager'),
              ),
            );
          }

          items.add(
            SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.solidUser,
              ),
              title: const Text('Usuario'),
            ),
          );

          return SalomonBottomBar(
            currentIndex: currentIndex,
            selectedItemColor: Colors.greenAccent,
            unselectedItemColor: Colors.green,
            itemPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 21),
            margin: const EdgeInsets.all(14),
            items: items,
            onTap: (int index) {
              String navigate;
              switch (index) {
                case 1:
                  navigate = '/ranking';
                  break;
                case 2:
                  if (isManager) {
                    navigate = '/manager';
                  } else {
                    navigate = '/user';
                  }

                  break;
                case 3:
                  navigate = '/user';
                  break;
                default:
                  navigate = '/main';
              }
              homeBloc.add(ChangeTabEvent(navigate));
            },
          );
        });
  }

  @override
  Widget? floatingActionButton(BuildContext context) => null;

  @override
  FloatingActionButtonLocation? floatingActionButtonLocation(
          BuildContext context) =>
      null;

  @override
  void dispose() {}
}
