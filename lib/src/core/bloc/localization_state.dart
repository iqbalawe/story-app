part of 'localization_bloc.dart';

@freezed
abstract class LocalizationState with _$LocalizationState {
  const factory LocalizationState({@Default(Locale('id')) Locale locale}) =
      _LocalizationState;
}
