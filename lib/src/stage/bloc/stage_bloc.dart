import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/auth/auth.dart';
import 'package:lappole/src/dao/factory_dao.dart';
import 'package:lappole/src/stage/bloc/stage_event.dart';
import 'package:lappole/src/stage/bloc/stage_state.dart';
import 'package:lappole/src/model/stage.dart';
import 'package:lappole/src/model/user.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_state.dart';
import 'package:lappole/src/user/sub_page/user_club/bloc/user_club_bloc.dart';
import 'package:lappole/src/user/sub_page/user_club/bloc/user_club_state.dart';

class StageBloc extends Bloc<StageEvent, StageState> {
  final factoryDao = Modular.get<FactoryDao>();
  final userClubBloc = Modular.get<UserClubBloc>();
  final auth = Modular.get<Auth>();
  final userBloc = Modular.get<UserBloc>();
  late StreamSubscription<UserState> userSubscription;
  StreamSubscription<UserClubState>? streamClubSubscription;

  List<Stage> _stages = [];
  User? _user;
  bool _hasClub = false;
  Stage? _currentStage;

  StageBloc() : super(StageInitState()) {
    on<StageInitialDataEvent>(_stageInitialDataEvent);
    on<AddDistanceEvent>(_addDistanceEvent);
    on<Navigate2StageDetailEvent>(_navigate2StageDetailEvent);
    on<StageonBackButtonEvent>(_stageonBackButtonEvent);

    userSubscription = userBloc.stream.listen((UserState state) => {
          if (state is UserIsLoginState)
            {_user = state.user, add(StageInitialDataEvent())}
          else if (state is UserIsLogoutState)
            {_user = null, add(StageInitialDataEvent())}
        });

    streamClubSubscription = userClubBloc.stream.listen((state) {
      if (state is UserClubJoinSuccessState) {
        _hasClub = true;
        add(StageInitialDataEvent());
      } else if (state is UserClubDisjoinSuccessState) {
        _hasClub = false;
        add(StageInitialDataEvent());
      }
    });

    _user = userBloc.user;
    _hasClub = _user?.hasClub ?? false;
  }

  void _stageInitialDataEvent(StageInitialDataEvent event, Emitter emit) async {
    if (auth.isLogged && (_hasClub)) {
      _stages = await factoryDao.stageDao.getStages(_user!.club!.id);
    } else {
      _stages = await factoryDao.stageDao.getNoAuthStages();
    }

    emit(_uploadStageFields());
  }

  void _addDistanceEvent(AddDistanceEvent event, Emitter emit) async {
    Stage currentStage =
        _stages.firstWhere((stage) => stage.id == event.stageId);

    currentStage.stageData?.addDistance(_user!.pendingDistance4Upload);

    //Guarda en BBDD con stream se sincroniza y no hace falta la siguiente
    //linea de código
    _user!.markActivitiesAsUploaded();

    emit(DistanceUploadedSuccessState("Distancia subida Satisfactoriamente!"));
    emit(_uploadStageFields());
  }

  void _navigate2StageDetailEvent(
      Navigate2StageDetailEvent event, Emitter emit) {
    _currentStage = _stages.firstWhere(
        (stage) => stage.id.compareTo(event.stageId) == 0 ? true : false);

    if (_currentStage?.hasData ?? false) {
      emit(Navigate2StageDetailState(_currentStage!));
    } else {
      emit(StageStateError('Etapa no desbloqueada'));
      emit(_uploadStageFields());
    }
  }

  void _stageonBackButtonEvent(
      StageonBackButtonEvent event, Emitter emit) async {
    emit(_uploadStageFields());
  }

  StageState _uploadStageFields() =>
      UploadStageFields(stages: _stages, user: _user);
}
