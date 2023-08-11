import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rest_bloc/model/user_model.dart';
import 'package:rest_bloc/resource/api_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    final ApiRepository apiRepository = ApiRepository();
    on<UserEvent>((event, emit) async {
      try {
        emit(UserLoading());
        final List<UserModel> userList = await apiRepository.fetchUserList();
        emit(USerLoaded(userList: userList));
        if (userList[0].error != null) {
          emit(UserError(error: userList[0].error));
        }
      } on NetworkError {
        emit(const UserError(
            error: "Failed to fetch data. is your device online ?"));
      }
    });
  }
}
