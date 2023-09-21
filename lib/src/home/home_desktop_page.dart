import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/home/home_basic_page.dart';
import 'package:lappole/src/home/bloc/home_bloc.dart';
import 'package:lappole/src/home/bloc/home_state.dart';

class HomeDesktopPage extends HomeBasicPage {
  final _pageController = PageController(initialPage: 0);
  HomeDesktopPage(String title, String version, {Key? key})
      : super(title, version, key: key);

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
    );
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    const RouterOutlet(),
    const RouterOutlet(),
    const RouterOutlet(),
  ];

  @override
  Widget body(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listener: (context, state) {
          if (state is HomeInitState) {
          } else if (state is ChangeTabSuccessState) {
            switch (state.index) {
              case 1:
                Modular.to.navigate('/ranking');
                break;
              case 2:
                Modular.to.navigate('/user');
                break;
              default:
            }
          }
        },
        buildWhen: (previous, state) {
          return state is ChangeTabSuccessState;
        },
        builder: (BuildContext context, state) {
          int currentIndex = 0;

          if (state is HomeInitState) {
          } else if (state is ChangeTabSuccessState) {
            // loading = false;
            currentIndex = state.index;
            if (_pageController.hasClients) {
              _pageController.jumpToPage(currentIndex);
            }
          }

          return PageView(
            controller: _pageController,
            children: List.generate(
                bottomBarPages.length, (index) => bottomBarPages[index]),
          );
        });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
