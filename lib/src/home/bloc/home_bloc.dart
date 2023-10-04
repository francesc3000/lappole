import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/home/bloc/home_event.dart';
import 'package:lappole/src/home/bloc/home_state.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_state.dart';
import 'package:lappole/src/user/sub_page/user_club/bloc/user_club_bloc.dart';
import 'package:lappole/src/user/sub_page/user_club/bloc/user_club_state.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final userBloc = Modular.get<UserBloc>();
  final userClubBloc = Modular.get<UserClubBloc>();
  String _currentNavigate = '/main';
  bool _hasClub = false;
  bool _isManager = false;
  StreamSubscription<UserState>? streamSubscription;
  StreamSubscription<UserClubState>? streamClubSubscription;

  HomeBloc() : super(HomeInitState()) {
    on<HomeInitDataEvent>(_homeInitDataEvent);
    on<ChangeTabEvent>(_changeTabEvent);

    streamSubscription = userBloc.stream.listen((state) {
      if (state is UserIsLoginState) {
        _isManager = state.user.isManager;
        _hasClub = state.user.hasClub;
        add(ChangeTabEvent(_currentNavigate));
      } else if (state is UserIsLogoutState) {
        _currentNavigate = '/main';
        _hasClub = false;
        _isManager = false;
        add(ChangeTabEvent(_currentNavigate));
      }
    });

    streamClubSubscription = userClubBloc.stream.listen((state) {
      if (state is UserClubJoinSuccessState) {
        _hasClub = true;
        _isManager = userBloc.user?.isManager ?? false;
        add(ChangeTabEvent(_currentNavigate));
      } else if (state is UserClubDisjoinSuccessState) {
        _hasClub = false;
        _isManager = false;
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
      emit(ChangeTabSuccessState(_currentNavigate, _hasClub, _isManager));
    } catch (error) {
      emit(error is HomeStateError
          ? HomeStateError(error.message)
          : HomeStateError('Algo fue mal!'));
    }
  }
}
