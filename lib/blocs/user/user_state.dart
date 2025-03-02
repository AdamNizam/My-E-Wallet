part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSuccess extends UserState {
  final List<UserModel> users;

  const UserSuccess(this.users);

  @override
  List<Object> get props => [users];
}

final class UserFailed extends UserState {
  final String e;

  const UserFailed(this.e);

  @override
  List<Object> get props => [e];
}
