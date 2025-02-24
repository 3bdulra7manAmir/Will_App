
import 'package:go_router/go_router.dart';
import 'package:will_app/Features/01_Splash/view/splash_view.dart';

abstract class AppRouter
{
  static const kSplashView = '/SplashView';

  static final router = GoRouter(
    routes:
    [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),

      GoRoute(
        path: kSplashView,
        name: kSplashView,
        builder: (context, state) => const SplashView(),
      )
    ],
  );
}
