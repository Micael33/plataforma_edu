import 'package:flutter/material.dart';

import 'src/presentation/pages/splash_page.dart';
import 'src/presentation/pages/login_page.dart';
import 'src/presentation/pages/signup_page.dart';
import 'src/presentation/pages/landing_page.dart';
import 'src/presentation/pages/home_page.dart';
import 'src/presentation/pages/children_page.dart';
import 'src/presentation/pages/caregivers_page.dart';
import 'src/presentation/pages/color_game_page.dart';
import 'src/presentation/pages/reports_page.dart';
import 'src/presentation/pages/report_details_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'O Caminho do Saber',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/landing': (context) => const LandingPage(),
        '/home': (context) => const HomePage(),
        '/children': (context) => const ChildrenPage(),
        '/caregivers': (context) => const CaregiversPage(),
        '/color-game': (context) {
          final args = ModalRoute.of(context)!.settings.arguments;
          final childId = args is int ? args : 0;
          return ColorGamePage(childId: childId);
        },
        '/reports': (context) => const ReportsPage(),
        '/report-details': (context) {
          final args = ModalRoute.of(context)!.settings.arguments;
          final childId = args is int ? args : 0;
          return ReportDetailsPage(childId: childId);
        },
      },
    );
  }
}
