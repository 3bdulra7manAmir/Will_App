import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:will_app/Config/i18n/localization_cubit/locale_cubit.dart';
import 'package:will_app/Core/constants/app_initializations.dart';

extension LocalizationExtension on String
{
  String get getTranslation
  {
    final BuildContext? context = navigatorKey.currentContext;
    if (context == null) return this;

    final localizationCubit = BlocProvider.of<LocalizationCubit>(context, listen: false);
    return localizationCubit.translate(this); // ✅ Fetch translation correctly
  }
}
