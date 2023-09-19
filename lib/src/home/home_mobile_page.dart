import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/feed/feed_page.dart';
import 'package:lappole/src/home/home_basic_page.dart';
import 'package:lappole/src/home/bloc/home_bloc.dart';
import 'package:lappole/src/home/bloc/home_state.dart';
import 'package:lappole/src/main/main_page.dart';
import 'package:lappole/src/user/user_page.dart';

class HomeMobilePage extends HomeBasicPage {
  final _pageController = PageController(initialPage: 0);
  HomeMobilePage(String title, {Key? key}) : super(title, key: key);

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
    // ModularApp(module: AppModule(), child: const AppWidget()),
    const MainPage(),
    const FeedPage(),
    const UserPage(),
  ];

  @override
  Widget body(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listener: (context, state) {
          if (state is HomeInitState) {
          } else if (state is UploadHomeFields) {
            Navigator.of(context).pushNamed('/user');
          }
        },
        builder: (BuildContext context, state) {
          int currentIndex = 0;
          bool loading = false;

          if (state is HomeInitState) {
            loading = true;
          } else if (state is UploadHomeFields) {
            loading = false;
            currentIndex = state.index;
            if (_pageController.hasClients) {
              _pageController.jumpToPage(currentIndex);
            }
          }

          if (loading) {
            return const Center(child: CircularProgressIndicator());
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
