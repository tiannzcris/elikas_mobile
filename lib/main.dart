import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/splash/splash_screen.dart';
import 'providers/core_providers.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: const ElikasApp(),
    ),
  );
}

class ElikasApp extends StatelessWidget {
  const ElikasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-LIKAS',
      theme: buildAppTheme(),
      home: const SplashScreen(),
    );
  }
}
