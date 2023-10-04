import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'manager_desktop_page.dart';
import 'manager_mobile_page.dart';

class ManagerPage extends StatelessWidget {
  const ManagerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenTypeLayout.builder(
        mobile: (BuildContext context) => OrientationLayoutBuilder(
          portrait: (context) =>
              ManagerMobilePage(AppLocalizations.of(context)!.title),
        ),
        tablet: (BuildContext context) => OrientationLayoutBuilder(
          portrait: (context) =>
              ManagerMobilePage(AppLocalizations.of(context)!.title),
        ),
        desktop: (BuildContext context) => OrientationLayoutBuilder(
          portrait: (context) =>
              ManagerDesktopPage(AppLocalizations.of(context)!.title),
        ),
      );
}
