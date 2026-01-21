part of 'localization_bloc.dart';

@freezed
class LocalizationEvent with _$LocalizationEvent {
  const factory LocalizationEvent.changeLanguage(String languageCode) =
      _ChangeLanguage;

  const factory LocalizationEvent.loadSavedLanguage() = _LoadSavedLanguage;
}
