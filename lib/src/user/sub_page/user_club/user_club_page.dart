import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'user_club_desktop_page.dart';
import 'user_club_mobile_page.dart';

class UserClubPage extends StatelessWidget {
  const UserClubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenTypeLayout.builder(
        mobile: (BuildContext context) => OrientationLayoutBuilder(
          portrait: (context) => UserClubMobilePage(),
        ),
        tablet: (BuildContext context) => OrientationLayoutBuilder(
          portrait: (context) => UserClubMobilePage(),
        ),
        desktop: (BuildContext context) => OrientationLayoutBuilder(
          portrait: (context) => UserClubDesktopPage(),
        ),
      );
}
