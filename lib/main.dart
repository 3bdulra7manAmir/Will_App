import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:will_app/Config/i18n/app_local.dart';
import 'package:will_app/Config/i18n/localization_cubit/locale_cubit.dart';
import 'package:will_app/Config/i18n/localization_cubit/locale_states.dart';
import 'package:will_app/Config/router/app_router.dart';
import 'package:will_app/Core/constants/app_initializations.dart';
import 'package:will_app/Core/utils/bloc_ovserver.dart';

void main() async {
  Bloc.observer = const SimpleBlocObserver();

  await FlutterLocalization.instance.ensureInitialized();
  AppLocalizationsInit().localizationsInitState();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    DevicePreview(
      enabled: true,
      builder:
          (context) => ScreenUtilInit(
            designSize: const Size(375, 812),
            builder:
                (context, child) => MultiBlocProvider(
                  providers:
                  [
                    BlocProvider(create: (context) => LocalizationCubit()),
                  ],
                  child: const WillApp(),
                ),
          ),
    ),
  );
}

class WillApp extends StatelessWidget
{
  const WillApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocBuilder<LocalizationCubit, LocalizationStates>(
      builder: (context, state)
      {
        if (state is LocalizationSuccessState)
        {
          mainLocaleLanguage = state.locale;
        }
        return MaterialApp.router(
          useInheritedMediaQuery: true,
          builder: DevicePreview.appBuilder,
          routerConfig: AppRouter.router,

          supportedLocales: localizationObj.supportedLocales,
          localizationsDelegates: localizationObj.localizationsDelegates,
          locale: mainLocaleLanguage,

          theme: ThemeData.light().copyWith(textTheme: GoogleFonts.montserratAlternatesTextTheme(),),
        );
      },
    );
  }
}
