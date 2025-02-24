import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:will_app/Config/i18n/localization_cubit/locale_states.dart';
import 'package:will_app/Core/constants/app_initializations.dart';
import 'package:flutter/material.dart';

class LocalizationCubit extends Cubit<LocalizationStates> {
  LocalizationCubit()
    : super(const LocalizationSuccessState(locale: Locale('en')));

  void changeLocale(String languageCode) async {
    emit(const LocalizationLoadingState());

    try {
      await Future.delayed(
        const Duration(seconds: 1),
      ); // Simulate loading delay

      final newLocale = Locale(languageCode);
      localizationObj.translate(languageCode); // Update localization
      emit(LocalizationSuccessState(locale: newLocale));
    } catch (e) {
      emit(LocalizationFailureState(errorMessage: e.toString()));
    }
  }
}
