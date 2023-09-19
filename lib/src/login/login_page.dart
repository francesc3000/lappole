import 'package:flutter/material.dart';
import 'package:lappole/src/login/login_desktop_page.dart';
import 'package:lappole/src/login/login_mobile_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenTypeLayout.builder(
        mobile: (BuildContext context) => OrientationLayoutBuilder(
          portrait: (context) => LoginMobilePage(),
        ),
        tablet: (BuildContext context) => OrientationLayoutBuilder(
          portrait: (context) => LoginMobilePage(),
        ),
        desktop: (BuildContext context) => OrientationLayoutBuilder(
          portrait: (context) => LoginDesktopPage(),
        ),
      );
}
