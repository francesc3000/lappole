import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/home/bloc/home_event.dart';
import 'package:lappole/src/home/bloc/home_state.dart';
import 'package:lappole/src/login/bloc/login_bloc.dart';
import 'package:lappole/src/login/bloc/login_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final loginBloc = Modular.get<LoginBloc>();
  int _currentIndex = 0;
  StreamSubscription<LoginState>? streamSubscription;

  HomeBloc() : super(HomeInitState()) {
    on<HomeEventEmpty>((event, emit) => emit(HomeInitState()));
    on<ChangeTabEvent>(_changeTabEvent);

    streamSubscription = loginBloc.stream.listen((state) {
      if (state is LoginSuccessState) {
        add(ChangeTabEvent(_currentIndex));
      }
    });
  }

  void _changeTabEvent(ChangeTabEvent event, Emitter emit) async {
    try {
      _currentIndex = event.index;
      emit(ChangeTabSuccessState(_currentIndex));
    } catch (error) {
      emit(error is HomeStateError
          ? HomeStateError(error.message)
          : HomeStateError('Algo fue mal!'));
    }
  }
}
