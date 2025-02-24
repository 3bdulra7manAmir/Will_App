import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

final FlutterLocalization localizationObj = FlutterLocalization.instance; //USED IN MAIN.DART
Locale mainLocaleLanguage = const Locale('ar'); //USED IN MAIN.DART

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();