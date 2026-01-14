part of 'localization_bloc.dart';

sealed class LocalizationEvent extends Equatable {
  const LocalizationEvent();

  @override
  List<Object> get props => [];
}

class ChangeLanguage extends LocalizationEvent {
  const ChangeLanguage({required this.languageCode});

  final String languageCode;

  @override
  List<Object> get props => [languageCode];
}
