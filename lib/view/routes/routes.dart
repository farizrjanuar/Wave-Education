import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wave_education/controller/UserController.dart';
import 'package:wave_education/model/User.dart';
import 'package:wave_education/view/core/auth/login_page/login_page.dart';
import 'package:wave_education/view/core/auth/signup/signup_page.dart';
import 'package:wave_education/view/core/dashboard/course/course_detail/course_detail_page.dart';
import 'package:wave_education/view/core/dashboard/course/module_detail/module_detail_page.dart';
import 'package:wave_education/view/core/dashboard/course/course_page.dart';
import 'package:wave_education/view/core/dashboard/dashboard_page.dart';
import 'package:wave_education/view/core/profile/profile_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/login",
      name: 'login',
      builder: (context, state) => const LoginPage(),
      pageBuilder: (context, state) => const NoTransitionPage(
        child: LoginPage(),
      ),
    ),
    GoRoute(
      path: "/signup",
      name: 'signup',
      builder: (context, state) => const SignupPage(),
      pageBuilder: (context, state) => const NoTransitionPage(
        child: SignupPage(),
      ),
    ),
    GoRoute(
      path: "/",
      name: 'dashboard',
      builder: (context, state) => const DashboardPage(),
      routes: [
        GoRoute(
          path: "profile",
          name: 'profile',
          builder: (context, state) => const ProfilePage(),
        ),
        GoRoute(
          path: 'courses',
          name: 'courses',
          builder: (context, state) => const CoursePage(),
        ),
        GoRoute(
          path: "courses/:courseName",
          name: 'DBCourse',
          builder: (context, state) {
            final courseName =
                state.pathParameters['courseName'] ?? 'no course';
            return CourseDetailPage(
              courseName: courseName,
            );
          },
          routes: [
            GoRoute(
              path: "/module/:moduleName",
              name: 'module',
              builder: (context, state) {
                final courseName = Uri.decodeComponent(
                    state.pathParameters['courseName'] ?? 'no_course');
                final moduleName = Uri.decodeComponent(
                    state.pathParameters['moduleName'] ?? 'no_module');
                return ModuleDetailPage(
                  courseName: courseName,
                  moduleName: moduleName,
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
  redirect: (context, state) async {
    final isLoggedIn = await checkUserLoggedIn();

    if (!isLoggedIn) {
      // Jika belum login, arahkan ke halaman login
      if (state.matchedLocation != '/login' &&
          state.matchedLocation == '/signup') {
        return '/signup';
      } else if (state.matchedLocation == '/login' &&
          state.matchedLocation != '/signup') {
        return '/login';
      } else if (state.matchedLocation != '/login' &&
          state.matchedLocation != '/signup') {
        return '/login';
      }
    } else if (isLoggedIn && state.matchedLocation == '/login') {
      // Jika sudah login, arahkan ke dashboard
      return '/';
    }
    // Tetap di halaman yang diminta
    return null;
  },
  initialLocation: '/login',
  routerNeglect: false,

  // debugLogDiagnostics: true,
);

Future<bool> checkUserLoggedIn() async {
  // Mengakses SharedPreferences untuk mengambil token
  final prefs = await SharedPreferences.getInstance();
  // Mengambil nilai token dari SharedPreferences
  final token = prefs.getString('userToken');

  // Periksa apakah token ada dan tidak kosong
  if (token != null && token.isNotEmpty) {
    return true; // Pengguna sudah login
  } else {
    return false; // Pengguna belum login
  }
}
