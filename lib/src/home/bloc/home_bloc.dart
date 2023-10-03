import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/home/bloc/home_event.dart';
import 'package:lappole/src/home/bloc/home_state.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_state.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final userBloc = Modular.get<UserBloc>();
  String _currentNavigate = '/';
  bool _isManager = false;
  StreamSubscription<UserState>? streamSubscription;

  HomeBloc() : super(HomeInitState()) {
    on<HomeInitDataEvent>(_homeInitDataEvent);
    on<ChangeTabEvent>(_changeTabEvent);

    streamSubscription = userBloc.stream.listen((state) {
      if (state is UserIsLoginState) {
        _isManager = state.user.isManager;
        add(ChangeTabEvent(_currentNavigate));
      } else if (state is UserIsLogoutState) {
        _currentNavigate = '/';
        _isManager = state.user.isManager;
        add(ChangeTabEvent(_currentNavigate));
      }
    });

    _isManager = userBloc.user?.isManager ?? false;
  }

  void _homeInitDataEvent(HomeInitDataEvent event, Emitter emit) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    emit(VersionDataState('Alpha-$version+$buildNumber'));
  }

  void _changeTabEvent(ChangeTabEvent event, Emitter emit) async {
    try {
      _currentNavigate = event.navigate;
      emit(ChangeTabSuccessState(_currentNavigate, _isManager));
    } catch (error) {
      emit(error is HomeStateError
          ? HomeStateError(error.message)
          : HomeStateError('Algo fue mal!'));
    }
  }
}
