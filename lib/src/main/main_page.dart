import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'main_desktop_page.dart';
import 'main_mobile_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenTypeLayout.builder(
        mobile: (BuildContext context) => OrientationLayoutBuilder(
          portrait: (context) =>
              MainMobilePage(AppLocalizations.of(context)!.title),
        ),
        tablet: (BuildContext context) => OrientationLayoutBuilder(
          portrait: (context) =>
              MainMobilePage(AppLocalizations.of(context)!.title),
        ),
        desktop: (BuildContext context) => OrientationLayoutBuilder(
          portrait: (context) =>
              MainDesktopPage(AppLocalizations.of(context)!.title),
        ),
      );
}
