import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lappole/src/home/home_basic_page.dart';
import 'package:lappole/src/home/bloc/home_bloc.dart';
import 'package:lappole/src/home/bloc/home_state.dart';
import 'package:lappole/src/utils/custom_flash.dart';

class HomeMobilePage extends HomeBasicPage {
  HomeMobilePage(String title, String version, {Key? key})
      : super(title, version, key: key);

  @override
  Widget body(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listener: (context, state) {
          if (state is HomeInitState) {
          } else if (state is ChangeTabSuccessState) {
            switch (state.index) {
              case 1:
                Modular.to.navigate('/ranking');
                break;
              case 2:
                Modular.to.navigate('/user');
                break;
              default:
                Modular.to.navigate('/main');
            }
          } else if (state is HomeStateError) {
            CustomFlash(context).show(
                message: state.message,
                color: Colors.red,
                iconData: FontAwesomeIcons.solidCircleXmark);
          }
        },
        buildWhen: (previous, state) {
          return state is ChangeTabSuccessState;
        },
        builder: (BuildContext context, state) {
          return const RouterOutlet();
        });
  }
}
