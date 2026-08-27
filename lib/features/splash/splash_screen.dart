import 'package:flutter/material.dart';
import '../shell/app_shell.dart';

/// The native OS splash (flutter_native_splash) only covers the brief
/// window before the Flutter engine starts -- and on Android 12+ that's
/// restricted to a small icon on a solid color, no custom picture
/// background is allowed there. This screen is what actually shows the
/// full illustrated background once the engine takes over, giving the
/// "logo over that background" look on every Android version.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1800), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const AppShell()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/background.png', fit: BoxFit.cover),
          // Darkens the illustration a bit so the white badge and text
          // read clearly on top of it, instead of literally pasting the
          // logo over busy artwork (that's the combination that looked
          // bad before) -- badge and text sit on their own darkened layer.
          Container(color: Colors.black.withValues(alpha: 0.35)),
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 3),
                Container(
                  width: 168,
                  height: 168,
                  padding: const EdgeInsets.all(14),
                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: Image.asset('assets/images/logo_badge_transparent.png', fit: BoxFit.contain),
                ),
                const SizedBox(height: 20),
                const Text(
                  'E-LIKAS',
                  style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Electronic Ligao Kaligtasan Sistema',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: Colors.white.withValues(alpha: 0.8), size: 15),
                    const SizedBox(width: 4),
                    Text('Ligao City, Albay', style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 12.5)),
                  ],
                ),
                const Spacer(flex: 4),
                const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2.4, color: Colors.white70),
                ),
                const SizedBox(height: 14),
                Text(
                  'Preparing emergency information…',
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.75), fontSize: 12.5),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
