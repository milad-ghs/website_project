part of 'language_cubit.dart';

@immutable
sealed class LanguageState {}

final class LanguageInitial extends LanguageState {}

final class LanguageSetState extends LanguageState{
  final String languageFont;
  final String languageLocal;

  LanguageSetState(this.languageFont, this.languageLocal);
}