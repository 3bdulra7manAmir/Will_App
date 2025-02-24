import 'package:flutter_localization/flutter_localization.dart';
import 'package:will_app/Core/constants/app_initializations.dart';

mixin AppLocale {
  static const String title = 'title';

  static const Map<String, dynamic> en = {title: 'Localization'};
  static const Map<String, dynamic> ar = {title: 'ترجمة'};
}

class AppLocalizationsInit {
  void localizationsInitState() {
    localizationObj.init(
      mapLocales: [
        const MapLocale('en', AppLocale.en),
        const MapLocale('ar', AppLocale.ar),
      ],
      initLanguageCode: 'en',
    );
  }
}
