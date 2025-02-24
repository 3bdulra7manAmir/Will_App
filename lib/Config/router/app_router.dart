
import 'package:go_router/go_router.dart';
import 'package:will_app/Config/backup/backup.dart';
import 'package:will_app/Core/constants/app_initializations.dart';
import 'package:will_app/Features/01_Splash/view/splash_view.dart';

abstract class AppRouter
{
  static const kSplashView = '/SplashView';
  static const kTestView = '/TestView';

  static final router = GoRouter(
    navigatorKey: navigatorKey,
    routes:
    [
      GoRoute(
        path: '/',
        builder: (context, state) => const TestView(),
      ),

      GoRoute(
        path: kSplashView,
        name: kSplashView,
        builder: (context, state) => const SplashView(),
      ),

      GoRoute(
        path: kTestView,
        name: kTestView,
        builder: (context, state) => const TestView(),
      ),
    ],
  );
}
