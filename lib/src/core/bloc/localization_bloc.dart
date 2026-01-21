import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'localization_bloc.freezed.dart';
part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc({required this.storage}) : super(const LocalizationState()) {
    on<_ChangeLanguage>((event, emit) async {
      if (state.locale.languageCode != event.languageCode) {
        await storage.write(key: 'language_code', value: event.languageCode);

        emit(state.copyWith(locale: Locale(event.languageCode)));
      }
    });

    on<_LoadSavedLanguage>((event, emit) async {
      final savedLanguage = await storage.read(key: 'language_code');

      if (savedLanguage != null) {
        emit(state.copyWith(locale: Locale(savedLanguage)));
      }
    });
  }

  final FlutterSecureStorage storage;
}
