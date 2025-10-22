part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}
final class GetUserLoading extends UserState {}
final class GetUserFailure extends UserState {
   final String errMessage;

  GetUserFailure({required this.errMessage});
}
final class GetUserSuccessfully extends UserState {
  final UserEntity user;

  GetUserSuccessfully({required this.user});
}
