import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/app.dart';
import 'package:lappole/src/home/bloc/home_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // FactoryDao factoryDao = FactoryDao();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
    ),
  ], child: ModularApp(module: AppModule(), child: const AppWidget())));
}
