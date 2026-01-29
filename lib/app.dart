import 'package:flutter/material.dart';

import 'src/presentation/pages/splash_page.dart';
import 'src/presentation/pages/login_page.dart';
import 'src/presentation/pages/signup_page.dart';
import 'src/presentation/pages/landing_page.dart';
import 'src/presentation/pages/home_page.dart';
import 'src/presentation/pages/children_page.dart';
import 'src/presentation/pages/caregivers_page.dart';
import 'src/presentation/pages/color_game_page.dart';
import 'src/presentation/pages/memory_game_page.dart';
import 'src/presentation/pages/reports_page.dart';
import 'src/presentation/pages/report_details_page.dart';
import 'src/presentation/pages/accessibility_settings_page.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/core/theme/app_theme.dart';
import 'src/presentation/providers/accessibility_provider.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(accessibilityProvider);
    return MaterialApp(
      title: 'O Caminho do Saber',
      theme: appTheme(reducedMotion: settings.reducedMotion, largeText: settings.largeText, highContrast: settings.highContrast),
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
        '/memory-game': (context) {
          final args = ModalRoute.of(context)!.settings.arguments;
          final childId = args is int ? args : 0;
          return MemoryGamePage(childId: childId);
        },
        '/reports': (context) => const ReportsPage(),
        '/accessibility': (context) => const AccessibilitySettingsPage(),
        '/report-details': (context) {
          final args = ModalRoute.of(context)!.settings.arguments;
          final childId = args is int ? args : 0;
          return ReportDetailsPage(childId: childId);
        },
      },
    );
  }
}
