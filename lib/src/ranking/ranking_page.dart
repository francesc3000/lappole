import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'ranking_desktop_page.dart';
import 'ranking_mobile_page.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenTypeLayout.builder(
        mobile: (BuildContext context) => OrientationLayoutBuilder(
          portrait: (context) =>
              RankingMobilePage(AppLocalizations.of(context)!.title),
        ),
        tablet: (BuildContext context) => OrientationLayoutBuilder(
          portrait: (context) =>
              RankingMobilePage(AppLocalizations.of(context)!.title),
        ),
        desktop: (BuildContext context) => OrientationLayoutBuilder(
          portrait: (context) =>
              RankingDesktopPage(AppLocalizations.of(context)!.title),
        ),
      );
}
