import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/auth/auth.dart';
import 'package:lappole/src/dao/factory_dao.dart';
import 'package:lappole/src/main/bloc/main_event.dart';
import 'package:lappole/src/main/bloc/main_state.dart';
import 'package:lappole/src/model/event.dart';
import 'package:lappole/src/model/user.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final factoryDao = Modular.get<FactoryDao>();
  final auth = Modular.get<Auth>();
  final userBloc = Modular.get<UserBloc>();
  late StreamSubscription<UserState> userSubscription;

  List<Event> _events = [];
  User? _user;

  MainBloc() : super(MainInitState()) {
    on<MainEventEmpty>((event, emit) => emit(MainInitState()));
    on<MainInitialDataEvent>(_mainInitialDataEvent);
    on<AddKmEvent>(_addKmEvent);

    userSubscription = userBloc.stream.listen((UserState state) => {
          if (state is UserIsLoginState)
            {_user = state.user, add(MainInitialDataEvent())}
        });
  }

  void _mainInitialDataEvent(MainInitialDataEvent event, Emitter emit) async {
    if (auth.isLogged && (_user?.hasClub ?? false)) {
      _events = await factoryDao.eventDao.getEvents(_user!.club!.id);
    } else {
      _events = await factoryDao.eventDao.getNoAuthEvents();
    }

    emit(_uploadMainFields());
  }

  void _addKmEvent(AddKmEvent event, Emitter emit) async {
    Event currentEvent =
        _events.firstWhere((element) => element.id == event.eventId);

    currentEvent.eventData?.counter++;

    emit(_uploadMainFields());
  }

  MainState _uploadMainFields() => UploadMainFields(events: _events);
}
