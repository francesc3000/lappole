import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/auth/auth.dart';
import 'package:lappole/src/dao/factory_dao.dart';
import 'package:lappole/src/main/bloc/main_event.dart';
import 'package:lappole/src/main/bloc/main_state.dart';
import 'package:lappole/src/model/stage.dart';
import 'package:lappole/src/model/user.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final factoryDao = Modular.get<FactoryDao>();
  final auth = Modular.get<Auth>();
  final userBloc = Modular.get<UserBloc>();
  late StreamSubscription<UserState> userSubscription;

  List<Stage> _stages = [];
  User? _user;

  MainBloc() : super(MainInitState()) {
    on<MainInitialDataEvent>(_mainInitialDataEvent);
    on<AddKmEvent>(_addKmEvent);

    userSubscription = userBloc.stream.listen((UserState state) => {
          if (state is UserIsLoginState)
            {_user = state.user, add(MainInitialDataEvent())}
        });
  }

  void _mainInitialDataEvent(MainInitialDataEvent event, Emitter emit) async {
    if (auth.isLogged && (_user?.hasClub ?? false)) {
      _stages = await factoryDao.stageDao.getStages(_user!.club!.id);
    } else {
      _stages = await factoryDao.stageDao.getNoAuthStages();
    }

    emit(_uploadMainFields());
  }

  void _addKmEvent(AddKmEvent event, Emitter emit) async {
    Stage currentStage =
        _stages.firstWhere((stage) => stage.id == event.eventId);

    currentStage.stageData?.counter++;

    emit(_uploadMainFields());
  }

  MainState _uploadMainFields() =>
      UploadMainFields(stages: _stages, currentStageIndex: 2);
}
