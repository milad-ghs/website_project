import "package:bloc/bloc.dart";
import "package:flutter/cupertino.dart";

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  void setLanguage(String languageFont, String languageLocal) {
    emit(LanguageSetState(languageFont, languageLocal));
  }
}
