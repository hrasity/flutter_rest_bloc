part of 'user_bloc.dart';

@immutable
sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class USerLoaded extends UserState {
  final List<UserModel> userList;

  const USerLoaded({required this.userList});
}

final class UserError extends UserState {
  final String? error;

  const UserError({required this.error});
}
