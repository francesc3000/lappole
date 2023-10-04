import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/auth/auth.dart';
import 'package:lappole/src/dao/factory_dao.dart';
import 'package:lappole/src/model/watch.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_state.dart';
import 'package:lappole/src/user/sub_page/user_club/bloc/user_club_event.dart';
import 'package:lappole/src/user/sub_page/user_club/bloc/user_club_state.dart';
import 'package:lappole/src/model/user.dart';

class UserClubBloc extends Bloc<UserClubEvent, UserClubState> {
  final _factoryDao = Modular.get<FactoryDao>();
  final auth = Modular.get<Auth>();
  final userBloc = Modular.get<UserBloc>();
  late StreamSubscription<UserState> userSubscription;
  String _clubPassword = '';

  User? _user;

  UserClubBloc() : super(UserClubInitState()) {
    on<UserClubInitialDataEvent>(_userClubInitialDataEvent);
    on<ClubPasswordChangeEvent>(_clubPasswordChangeEvent);
    on<AddDeleteClubEvent>(_addDeleteClubEvent);
    on<AddDeleteWatchEvent>(_addDeleteWatchEvent);
    on<LoginThirdPartyEvent>(_loginThirdPartyEvent);

    userSubscription = userBloc.stream.listen((UserState state) => {
          if (state is UserIsLoginState)
            {_user = state.user, add(UserClubInitialDataEvent())}
        });

    _user = userBloc.user;
  }

  void _userClubInitialDataEvent(
      UserClubInitialDataEvent event, Emitter emit) async {
    try {
      emit(UploadUserClubLoginState(_user!));
    } on UserStateError catch (error) {
      emit(error);
    }
  }

  void _clubPasswordChangeEvent(ClubPasswordChangeEvent event, Emitter emit) {
    _clubPassword = event.clubPassword;
  }

  void _addDeleteClubEvent(AddDeleteClubEvent event, Emitter emit) async {
    try {
      if (_user!.hasClub) {
        await _factoryDao.userDao.disjoinClub(_user!.id, _clubPassword);
        //TODO: Quitar cuando se guarde en firebase
        _user!.club = null;
        emit(UserClubDisjoinSuccessState());
      } else {
        _user!.club =
            await _factoryDao.clubDao.getClubByPassword(_clubPassword);
        if (_user!.club == null) {
          emit(UserClubStateError('Contraseña Club no válida'));
        } else {
          await _factoryDao.userDao.joinClub(_user!.id, _user!.club!.id);
          emit(UserClubJoinSuccessState());
        }
      }

      emit(UploadUserClubLoginState(_user!));
    } on UserClubStateError catch (error) {
      emit(error);
    }
  }

  void _addDeleteWatchEvent(AddDeleteWatchEvent event, Emitter emit) async {
    try {
      //TODO: Hacer
      if (_user!.hasWatch) {
        _user!.watch = null;
      } else {
        _user!.watch = Watch(id: '222', name: 'Garmin 1');
      }

      emit(UploadUserClubLoginState(_user!));
    } on UserClubStateError catch (error) {
      emit(error);
    }
  }

  void _loginThirdPartyEvent(LoginThirdPartyEvent event, Emitter emit) async {
    try {
      //TODO: Hacer
      _user!.thirdParty.setLoginState();

      //Actualizar user en BBDD

      emit(UploadUserClubLoginState(_user!));
    } on UserClubStateError catch (error) {
      emit(error);
    }
  }
}
