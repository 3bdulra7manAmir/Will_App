import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:will_app/Config/i18n/localization_cubit/locale_states.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationCubit extends Cubit<LocalizationStates>
{
  Map<String, dynamic> _localizedStrings = {};

  LocalizationCubit() : super(const LocalizationLoadingState())
  {
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async
  {
    final prefs = await SharedPreferences.getInstance();
    final savedLang = prefs.getString('language') ?? 'ar';

    await _loadLanguage(savedLang);
    emit(LocalizationSuccessState(locale: Locale(savedLang))); // ✅ Emit state after loading language
  }


  Future<void> changeLocale(String languageCode) async
  {
    emit(const LocalizationLoadingState());

    try
    {
      await _loadLanguage(languageCode);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('language', languageCode);

      emit(LocalizationSuccessState(locale: Locale(languageCode))); // ✅ Emit new success state after language change
    }

    catch (e)
    {
      emit(LocalizationFailureState(errorMessage: e.toString()));
    }
  }


  Future<void> _loadLanguage(String languageCode) async
  {
    try
    {
      final String jsonString = await rootBundle.loadString('assets/json/i18n/$languageCode.json');
      _localizedStrings = json.decode(jsonString);

      print("✅ Loaded translations: $_localizedStrings"); // 🔹 Debug log
    }

    catch (e)
    {
      print("❌ Error loading language file: $e"); // 🔹 Debug log
      _localizedStrings = {};
    }
  }


  String translate(String key)
  {
    print("🔹 Translating key: $key");
    print("🔹 Available translations: $_localizedStrings");
    
    return _localizedStrings[key] ?? key; // ✅ Ensure correct fetching
  }
}
