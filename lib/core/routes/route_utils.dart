import 'package:ahad_ayna_interview_project/core/routes/app_route_keys.dart';
import 'package:ahad_ayna_interview_project/core/routes/navigation_service.dart';
import 'package:ahad_ayna_interview_project/core/user/user.dart';
import 'package:ahad_ayna_interview_project/features/authentication/presentation/pages/login_page.dart';
import 'package:ahad_ayna_interview_project/features/authentication/presentation/pages/register_page.dart';
// import 'package:ahad_ayna_interview_project/features/chat/presentation/pages/chat_list_page.dart';
import 'package:ahad_ayna_interview_project/features/chat/presentation/pages/chat_page.dart';
import 'package:ahad_ayna_interview_project/features/home/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

class RouteUtils {
  var goRouter = GoRouter(
      navigatorKey: NavigationService().navigatorKey,
      initialLocation: AppRoutes.home,
      redirect: (context, state) async {
        var isLoggedIn = await User().isLoggedIn;
        print("Is user Logged in $isLoggedIn");

        var unProtectedRoutes = (state.topRoute?.name == AppRoutes.login ||
            state.topRoute?.name == AppRoutes.register);

        /// when user is authenticated
        if (isLoggedIn && unProtectedRoutes) {
          return AppRoutes.home;
        }

        /// when user is NOT authenticated
        if (!isLoggedIn && !unProtectedRoutes) {
          return AppRoutes.login;
        }

        return null;
      },
      routes: [
        GoRoute(
            builder: (context, state) => const LoginPage(),
            name: AppRoutes.login,
            path: AppRoutes.login),
        GoRoute(
            builder: (context, state) => const ChatPage(),
            name: AppRoutes.chat,
            path: AppRoutes.chat),
        GoRoute(
            builder: (context, state) => RegisterPage(),
            name: AppRoutes.register,
            path: AppRoutes.register),
        GoRoute(
            builder: (context, state) => const HomePage(),
            name: AppRoutes.home,
            path: AppRoutes.home),
      ]);
}
