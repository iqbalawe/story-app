import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app/src/features/auth/domain/domain.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.repository}) : super(const AuthState.initial()) {
    on<_LoginRequested>((event, emit) async {
      emit(const AuthState.loading());
      try {
        await repository.login(event.email, event.password);
        emit(const AuthState.loginSuccess());
      } catch (e) {
        final message = e.toString().replaceAll('Exception: ', '');
        emit(AuthState.failure(message));
      }
    });

    on<_RegisterRequested>((event, emit) async {
      emit(const AuthState.loading());
      try {
        final message = await repository.register(
          event.name,
          event.email,
          event.password,
        );
        emit(AuthState.registerSuccess(message));
      } catch (e) {
        final message = e.toString().replaceAll('Exception: ', '');
        emit(AuthState.failure(message));
      }
    });

    on<_CheckRequested>((event, emit) async {
      try {
        final hasToken = await repository.isLoggedIn();
        if (hasToken) {
          emit(const AuthState.authenticated());
        } else {
          emit(const AuthState.unauthenticated());
        }
      } catch (e) {
        emit(const AuthState.unauthenticated());
      }
    });

    on<_LogoutRequested>((event, emit) async {
      emit(const AuthState.loading());
      await repository.logout();
      emit(const AuthState.unauthenticated());
    });
  }

  final AuthRepository repository;
}
