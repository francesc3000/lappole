import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/auth/auth.dart';
import 'package:lappole/src/dao/factory_dao.dart';
import 'package:lappole/src/login/bloc/login_bloc.dart';
import 'package:lappole/src/login/bloc/login_state.dart';
import 'package:lappole/src/model/activity.dart';
import 'package:lappole/src/model/user.dart';
import 'package:lappole/src/user/bloc/user_event.dart';
import 'package:lappole/src/user/bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final _auth = Modular.get<Auth>();
  final loginBloc = Modular.get<LoginBloc>();
  final _factoryDao = Modular.get<FactoryDao>();
  User? user;
  StreamSubscription<LoginState>? streamSubscription;

  UserBloc() : super(UserInitState()) {
    on<InitUserDataEvent>(_initUserDataEvent);

    streamSubscription = loginBloc.stream.listen((state) {
      if (state is LoginSuccessState) {
        add(InitUserDataEvent());
      }
    });
  }

  void _initUserDataEvent(InitUserDataEvent event, Emitter emit) async {
    if (_auth.isLogged) {
      try {
        //TODO: Quitar ?? '' cuando Auth este funcionando
        user = await _factoryDao.userDao.getUserData(_auth.userId ?? '');

        //Se recogen las actividades de las plataformas de terceros
        await _getThirdPartyActivities();

        emit(UserIsLoginState(user!));
        emit(UploadUserInitState(user!));
      } on UserStateError catch (error) {
        emit(error);
      }
    }
  }

  Future<void> _getThirdPartyActivities() async {
    List<Activity> activities = [];

    if (user!.hasWatch) {
      activities = await _factoryDao.activityDao.getWatchActivities();
    } else if (user!.thirdParty.isLogin) {
      activities = await _factoryDao.activityDao.getThirtPartyActivities();
    }

    //Se valida que las actividades recuperadas de terceras partes no se solapen
    //con actividades ya subidas a la app
    for (var thirdActivity in activities) {
      if (user!.activities?.indexWhere((activity) {
            //Para marcar que no se solapa existen varios escenarios posibles:

            // 1.
            //    |---------------------------|
            //    |---------------------------|
            if (activity.startDate == thirdActivity.startDate &&
                activity.endDate == thirdActivity.endDate) {
              return false;
            }

            // 2.
            //    |---------------------------|
            // |----------------------------------|
            if (activity.startDate.isBetween(
                    thirdActivity.startDate, thirdActivity.endDate) &&
                activity.endDate.isBetween(
                    thirdActivity.startDate, thirdActivity.endDate)) {
              return false;
            }

            // 3.
            //    |---------------------------|
            // |----------------|
            if (activity.startDate.isBetween(
                    thirdActivity.startDate, thirdActivity.endDate) &&
                thirdActivity.endDate
                    .isBetween(activity.startDate, activity.endDate)) {
              return false;
            }

            // 4.
            //    |---------------------------|
            //        |----------------------------------|
            if (thirdActivity.startDate
                    .isBetween(activity.startDate, activity.endDate) &&
                activity.endDate.isBetween(
                    thirdActivity.startDate, thirdActivity.endDate)) {
              return false;
            }
            // 5.
            //    |---------------------------|
            //        |---------|
            if (thirdActivity.startDate
                    .isBetween(activity.startDate, activity.endDate) &&
                thirdActivity.endDate
                    .isBetween(activity.startDate, activity.endDate)) {
              return false;
            }

            return true;
          }) ==
          -1) {
        //Si la actividad no se solapa se introduce en la lista de actividades
        user!.activities == null
            ? [thirdActivity]
            : user!.activities!.add(thirdActivity);
      } else {
        thirdActivity.observation = 'Se solapa con otra Actividad';
        user!.activities!.add(thirdActivity);
      }
    }

    //Se ordena por startDate DESCENDING
    user!.activities?.sort((a, b) => (a.startDate.compareTo(b.startDate)) * -1);
  }
}

extension DateTimeExtension on DateTime {
  bool isAfterOrEqualTo(DateTime dateTime) {
    final date = this;
    final isAtSameMomentAs = dateTime.isAtSameMomentAs(date);
    return isAtSameMomentAs | date.isAfter(dateTime);
  }

  bool isBeforeOrEqualTo(DateTime dateTime) {
    final date = this;
    final isAtSameMomentAs = dateTime.isAtSameMomentAs(date);
    return isAtSameMomentAs | date.isBefore(dateTime);
  }

  bool isBetween(
    DateTime fromDateTime,
    DateTime toDateTime,
  ) {
    final date = this;
    final isAfter = date.isAfterOrEqualTo(fromDateTime);
    final isBefore = date.isBeforeOrEqualTo(toDateTime);
    return isAfter && isBefore;
  }
}
