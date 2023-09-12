import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/auth/auth.dart';
import 'package:lappole/src/auth/auth_guard.dart';
import 'package:lappole/src/dao/factory_dao.dart';
import 'package:lappole/src/home/bloc/home_bloc.dart';
import 'package:lappole/src/home/home_page.dart';
import 'package:lappole/src/login/login_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lappole/src/main/bloc/main_bloc.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/user_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Lappole',
      theme: ThemeData(primarySwatch: Colors.green),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('es', ''),
        Locale('ca', ''),
      ],
      // routeInformationParser: Modular.routeInformationParser,
      // routerDelegate: Modular.routerDelegate,
      routerConfig: Modular.routerConfig,
    ); //added by extension
  }
}

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(Auth.new);
    i.addSingleton(FactoryDao.new);
    // Bloc
    i.addSingleton<HomeBloc>(HomeBloc.new,
        config: BindConfig(
          onDispose: (bloc) => bloc.close(),
        ));
    i.addSingleton<MainBloc>(MainBloc.new,
        config: BindConfig(
          onDispose: (bloc) => bloc.close(),
        ));
    i.addSingleton<UserBloc>(UserBloc.new,
        config: BindConfig(
          onDispose: (bloc) => bloc.close(),
        ));
  }

  @override
  void routes(RouteManager r) {
    r.child('/',
        child: (context) => const HomePage(),
        // guards: [AuthGuard()],
        transition: TransitionType.fadeIn);
    r.child('/login',
        child: (context) => const LoginPage(),
        transition: TransitionType.fadeIn);
    r.child('/user',
        child: (context) => const UserPage(),
        guards: [AuthGuard()],
        transition: TransitionType.fadeIn);
    // r.module('/b-module', module: BModule());
  }
}
