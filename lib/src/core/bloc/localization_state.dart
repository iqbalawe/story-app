part of 'localization_bloc.dart';

class LocalizationState extends Equatable {
  const LocalizationState(this.locale);

  final Locale locale;

  factory LocalizationState.initial() {
    return LocalizationState(Locale('id'));
  }

  @override
  List<Object> get props => [locale];
}
