import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/auth/auth.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/login');

  @override
  Future<bool> canActivate(String path, ModularRoute route) {
    return Future.value(Modular.get<Auth>().isLogged);
  }
}
