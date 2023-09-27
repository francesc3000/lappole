import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lappole/src/user/user_desktop_page.dart';
import 'package:lappole/src/user/user_mobile_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenTypeLayout.builder(
        mobile: (BuildContext context) => OrientationLayoutBuilder(
          portrait: (context) =>
              UserMobilePage(AppLocalizations.of(context)!.title),
        ),
        tablet: (BuildContext context) => OrientationLayoutBuilder(
          portrait: (context) =>
              UserMobilePage(AppLocalizations.of(context)!.title),
        ),
        desktop: (BuildContext context) => OrientationLayoutBuilder(
          portrait: (context) =>
              UserDesktopPage(AppLocalizations.of(context)!.title),
        ),
      );
}
