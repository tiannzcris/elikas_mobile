import 'package:drift/native.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:elikas_mobile/database/database.dart';
import 'package:elikas_mobile/main.dart';
import 'package:elikas_mobile/providers/core_providers.dart';
import 'package:elikas_mobile/providers/settings_providers.dart';

void main() {
  testWidgets('App boots to the Home tab', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          // In-memory, same-isolate DB and a fake platform version --
          // avoids the isolate-backed drift_flutter executor and the
          // package_info_plus platform channel, neither available here.
          appDatabaseProvider.overrideWithValue(AppDatabase.forTesting(NativeDatabase.memory())),
          isOnlineProvider.overrideWith((ref) => Stream.value(true)),
          packageInfoProvider.overrideWith(
            (ref) async => PackageInfo(appName: 'E-LIKAS', packageName: 'com.example.elikas_mobile', version: '1.0.0', buildNumber: '1'),
          ),
        ],
        child: const ElikasApp(),
      ),
    );
    await tester.pump();

    expect(find.text('E-LIKAS'), findsOneWidget);
    expect(find.text('Situation Overview'), findsOneWidget);

    // Dispose the tree here (not in automatic teardown) so the drift
    // package's zero-duration "mark stream closed" timer, scheduled on
    // dispose, gets a chance to fire before the test framework's pending-
    // timer check runs.
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(milliseconds: 1));
  });
}
