import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lappole/src/feed/feed_page.dart';
import 'package:lappole/src/home/home_basic_page.dart';
import 'package:lappole/src/home/bloc/home_bloc.dart';
import 'package:lappole/src/home/bloc/home_event.dart';
import 'package:lappole/src/home/bloc/home_state.dart';

class HomeDesktopPage extends HomeBasicPage {
  HomeDesktopPage(String title, {Key? key}) : super(title, key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context, {String? title}) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 140, 71, 153),
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
        IconButton(
            onPressed: () =>
                BlocProvider.of<HomeBloc>(context).add(ChangeTabEvent(5)),
            icon: const Icon(FontAwesomeIcons.solidUser))
      ],
    );
  }

  @override
  Widget body(BuildContext context) {
    Widget? feedPage;
    feedPage ??= const FeedPage();
    List<Widget?> pages = [
      feedPage,
    ];

    return BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, state) {
      int? currentIndex = 0;
      bool loading = false;

      if (state is HomeInitState) {
        loading = true;
        // BlocProvider.of<AuthBloc>(context).add(AutoLogInEvent());
      } else if (state is UploadHomeFields) {
        loading = false;
        currentIndex = state.index;
      }

      if (loading) {
        return const Center(child: CircularProgressIndicator());
      }

      return pages[currentIndex]!;
    });
  }
}
