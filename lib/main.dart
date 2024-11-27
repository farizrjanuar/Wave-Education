import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import google fonts
import 'package:wave_education/src/core/auth/login_page/login_page.dart';
import 'package:wave_education/src/core/auth/signup/signup_page.dart';
import 'package:wave_education/src/core/dashboard/dashboard_page.dart';
import 'package:wave_education/src/core/profile/profile_page.dart';
import 'package:wave_education/src/widgets/main_header.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        path: "/dashboard",
        name: 'dashboard',
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        path: "/profile",
        name: 'profile',
        builder: (context, state) => const ProfilePage(),
      ),
    ],
    initialLocation: "/login",
    debugLogDiagnostics: true,
  );

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MainHeader(),
        ),
        body: DashboardPage());
  }
}
