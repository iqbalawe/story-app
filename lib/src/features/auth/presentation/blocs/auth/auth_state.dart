part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoginSuccess extends AuthState {}

final class AuthRegisterSuccess extends AuthState {
  const AuthRegisterSuccess(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

final class Authenticated extends AuthState {}

final class Unauthenticated extends AuthState {}

final class AuthFailure extends AuthState {
  const AuthFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
