import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/auth/auth.dart';
import 'package:lappole/src/dao/factory_dao.dart';
import 'package:lappole/src/model/club.dart';
import 'package:lappole/src/model/user.dart';
import 'package:lappole/src/model/watch.dart';
import 'package:lappole/src/user/bloc/user_event.dart';
import 'package:lappole/src/user/bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final _auth = Modular.get<Auth>();
  final _factoryDao = Modular.get<FactoryDao>();
  User? _user;
  String _clubPassword = '';

  UserBloc() : super(UserInitState()) {
    on<UserEventEmpty>((event, emit) => emit(UserInitState()));
    on<InitUserDataEvent>(_initUserDataEvent);
    on<ClubPasswordChangeEvent>(_clubPasswordChangeEvent);
    on<AddDeleteClubEvent>(_addDeleteClubEvent);
    on<AddDeleteWatchEvent>(_addDeleteWatchEvent);
    on<LoginThirdPartyEvent>(_loginThirdPartyEvent);
  }

  void _initUserDataEvent(InitUserDataEvent event, Emitter emit) async {
    if (_auth.isLogged) {
      //TODO: Quitar ?? '' cuando Auth este funcionando
      _user = await _factoryDao.userDao.getUserData(_auth.userId ?? '');

      emit(UserIsLoginState(_user!));
      emit(UploadUserInitState(_user!));

      // emit(UploadUserActivitiesState(_user!.activities, _user!.hasActivities));
      // emit(UploadUserClubState(_user!.club));
      // emit(UploadUserWatchState(_user!.watch, _user!.canAddWatch));
      // emit(UploadThirdPartyState(_user!.thirdParty, _user!.canThirdPartyLogin));
    }
  }

  void _clubPasswordChangeEvent(ClubPasswordChangeEvent event, Emitter emit) {
    _clubPassword = event.clubPassword;
  }

  void _addDeleteClubEvent(AddDeleteClubEvent event, Emitter emit) async {
    if (_user!.hasClub) {
      await _factoryDao.userDao.disjoinClub(_user!.id, _clubPassword);
      //TODO: Quitar cuando se guarde en firebase
      _user!.club = null;
    } else {
      await _factoryDao.userDao.joinClub(_user!.id, _clubPassword);
      //TODO: Quitar cuando se guarde en firebase
      _user!.club = Club(id: '222', name: _clubPassword);
    }

    emit(UploadUserClubLoginState(_user!));
  }

  void _addDeleteWatchEvent(AddDeleteWatchEvent event, Emitter emit) async {
    //TODO: Hacer
    if (_user!.hasWatch) {
      _user!.watch = null;
    } else {
      _user!.watch = Watch(id: '222', name: 'Garmin 1');
    }

    emit(UploadUserClubLoginState(_user!));
  }

  void _loginThirdPartyEvent(LoginThirdPartyEvent event, Emitter emit) async {
    //TODO: Hacer
    _user!.thirdParty.setLoginState();

    emit(UploadUserClubLoginState(_user!));
  }
}
