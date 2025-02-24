import 'package:will_app/Core/constants/app_initializations.dart';

extension LocalizationExtension on String
{
  String get getTranslation
  {
    localizationObj.translate(this); // This updates the locale but does NOT return a String
    return this;                     // Return the original key since `translate()` is void
  }
}
