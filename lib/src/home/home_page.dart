import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/home/bloc/home_bloc.dart';
import 'package:lappole/src/home/bloc/home_event.dart';
import 'package:lappole/src/home/bloc/home_state.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:upgrader/upgrader.dart';

import 'home_desktop_page.dart';
import 'home_mobile_page.dart';

class HomePage extends StatelessWidget {
  final homeBloc = Modular.get<HomeBloc>();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
      bloc: homeBloc,
      buildWhen: (previous, state) {
        return state is VersionDataState;
      },
      builder: (context, state) {
        String version = '';
        if (state is HomeInitState) {
          homeBloc.add(HomeInitDataEvent());
        } else if (state is VersionDataState) {
          version = state.version;
        }

        return UpgradeAlert(
          child: ScreenTypeLayout.builder(
            mobile: (BuildContext context) => OrientationLayoutBuilder(
              portrait: (context) =>
                  HomeMobilePage(AppLocalizations.of(context)!.title, version),
            ),
            tablet: (BuildContext context) => OrientationLayoutBuilder(
              portrait: (context) =>
                  HomeMobilePage(AppLocalizations.of(context)!.title, version),
            ),
            desktop: (BuildContext context) => OrientationLayoutBuilder(
              portrait: (context) =>
                  HomeDesktopPage(AppLocalizations.of(context)!.title, version),
            ),
          ),
        );
      });
}
