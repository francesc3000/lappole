import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/auth/auth.dart';
import 'package:lappole/src/dao/factory_dao.dart';
import 'package:lappole/src/ranking/bloc/ranking_event.dart';
import 'package:lappole/src/ranking/bloc/ranking_state.dart';
import 'package:lappole/src/model/user.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';
import 'package:lappole/src/user/bloc/user_state.dart';

class RankingBloc extends Bloc<RankingEvent, RankingState> {
  final factoryDao = Modular.get<FactoryDao>();
  final auth = Modular.get<Auth>();
  final userBloc = Modular.get<UserBloc>();
  late StreamSubscription<UserState> userSubscription;

  User? _user;

  RankingBloc() : super(RankingInitState()) {
    on<RankingInitialDataEvent>(_rankingInitialDataEvent);

    userSubscription = userBloc.stream.listen((UserState state) => {
          if (state is UserIsLoginState)
            {_user = state.user, add(RankingInitialDataEvent())}
          else if (state is UserIsLogoutState)
            {_user = null, add(RankingInitialDataEvent())}
        });
  }

  void _rankingInitialDataEvent(
      RankingInitialDataEvent event, Emitter emit) async {
    if (auth.isLogged && (_user?.hasClub ?? false)) {
    } else {}
  }
}
