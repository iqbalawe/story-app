import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app/src/features/auth/domain/domain.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await repository.login(event.email, event.password);
        emit(AuthLoginSuccess());
      } catch (e) {
        final message = e.toString().replaceAll('Exception: ', '');
        emit(AuthFailure(message));
      }
    });

    on<AuthRegisterRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final message = await repository.register(
          event.name,
          event.email,
          event.password,
        );
        emit(AuthRegisterSuccess(message));
      } catch (e) {
        final message = e.toString().replaceAll('Exception: ', '');
        emit(AuthFailure(message));
      }
    });

    on<AuthCheckRequested>((event, emit) async {
      try {
        final hasToken = await repository.isLoggedIn();
        if (hasToken) {
          emit(Authenticated());
        } else {
          emit(Unauthenticated());
        }
      } catch (e) {
        emit(Unauthenticated());
      }
    });

    on<AuthLogoutRequested>((event, emit) async {
      emit(AuthLoading());
      await repository.logout();
      emit(Unauthenticated());
    });
  }

  final AuthRepository repository;
}
