import 'package:bloc/bloc.dart';
import 'package:lappole/src/user/bloc/user_event.dart';
import 'package:lappole/src/user/bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitState()) {
    on<UserEventEmpty>((event, emit) => emit(UserInitState()));
  }

  UserState _uploadUserFields() => UploadUserFields();
}
