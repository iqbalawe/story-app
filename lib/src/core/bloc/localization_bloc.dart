import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc({required this.storage})
    : super(LocalizationState.initial()) {
    on<ChangeLanguage>((event, emit) async {
      if (state.locale.languageCode != event.languageCode) {
        await storage.write(key: 'language_code', value: event.languageCode);

        emit(LocalizationState(Locale(event.languageCode)));
      }
    });

    on<LoadSavedLanguage>((event, emit) async {
      final savedLanguage = await storage.read(key: 'language_code');

      if (savedLanguage != null) {
        emit(LocalizationState(Locale(savedLanguage)));
      }
    });
  }

  final FlutterSecureStorage storage;
}
