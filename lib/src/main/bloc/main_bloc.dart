import 'package:bloc/bloc.dart';
import 'package:lappole/src/main/bloc/main_event.dart';
import 'package:lappole/src/main/bloc/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitState()) {

    on<MainEventEmpty>((event, emit) => emit(MainInitState()));
  }

  MainState _uploadMainFields() => UploadMainFields();
}
