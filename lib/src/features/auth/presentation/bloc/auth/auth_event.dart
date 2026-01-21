part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loginRequested(String email, String password) =
      _LoginRequested;

  const factory AuthEvent.registerRequested(
    String name,
    String email,
    String password,
  ) = _RegisterRequested;

  const factory AuthEvent.checkRequested() = _CheckRequested;

  const factory AuthEvent.logoutRequested() = _LogoutRequested;
}
