import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationState.initial()) {
    on<ChangeLanguage>((event, emit) {
      if (state.locale.languageCode != event.languageCode) {
        emit(LocalizationState(Locale(event.languageCode)));
      }
    });
  }
}
