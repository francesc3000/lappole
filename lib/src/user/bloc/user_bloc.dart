import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/auth/auth.dart';
import 'package:lappole/src/dao/factory_dao.dart';
import 'package:lappole/src/model/user.dart';
import 'package:lappole/src/user/bloc/user_event.dart';
import 'package:lappole/src/user/bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final _auth = Modular.get<Auth>();
  final _factoryDao = Modular.get<FactoryDao>();
  User? _user;

  UserBloc() : super(UserInitState()) {
    on<UserEventEmpty>((event, emit) => emit(UserInitState()));
    on<InitUserDataEvent>(_initUserDataEvent);
  }

  void _initUserDataEvent(InitUserDataEvent event, Emitter emit) async {
    if (_auth.isLogged) {
      //TODO: Quitar ?? '' cuando Auth este funcionando
      _user = await _factoryDao.userDao.getUserData(_auth.userId ?? '');

      emit(UserIsLoginState(_user!));
    }
  }

  UserState _uploadUserFields() => UploadUserFields(user: _user);
}
