import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/stage/bloc/stage_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'stage_detail_desktop_page.dart';
import 'stage_detail_mobile_page.dart';

class StageDetailPage extends StatelessWidget {
  final mainBloc = Modular.get<StageBloc>();
  StageDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenTypeLayout.builder(
        mobile: (BuildContext context) => OrientationLayoutBuilder(
          portrait: (context) =>
              StageDetailMobilePage(AppLocalizations.of(context)!.title),
        ),
        tablet: (BuildContext context) => OrientationLayoutBuilder(
          portrait: (context) =>
              StageDetailMobilePage(AppLocalizations.of(context)!.title),
        ),
        desktop: (BuildContext context) => OrientationLayoutBuilder(
          portrait: (context) =>
              StageDetailDesktopPage(AppLocalizations.of(context)!.title),
        ),
      );
}
