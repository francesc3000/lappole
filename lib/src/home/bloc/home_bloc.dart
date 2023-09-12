import 'package:bloc/bloc.dart';
import 'package:lappole/src/home/bloc/home_event.dart';
import 'package:lappole/src/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int _currentIndex = 0;

  HomeBloc() : super(HomeInitState()) {

    on<HomeEventEmpty>((event, emit) => emit(HomeInitState()));
    on<ChangeTabEvent>(_changeTabEvent);
  }

  void _changeTabEvent(ChangeTabEvent event, Emitter emit) async {
    try {
      _currentIndex = event.index;
      emit(_uploadHomeFields());
    } catch (error) {
      emit(error is HomeStateError
          ? HomeStateError(error.message)
          : HomeStateError('Algo fue mal en el AutoLogIn!'));
    }
  }

  HomeState _uploadHomeFields() => UploadHomeFields(
      index: _currentIndex);
}
