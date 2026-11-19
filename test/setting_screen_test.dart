import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/views/setting_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  group('UserSettings', () {
    setUp(() {
      SharedPreferencesAsyncPlatform.instance =
          InMemorySharedPreferencesAsync.empty();
    });

    testWidgets('SettingsScreen displays form fields and switches', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));
      await tester.pumpAndSettle();

      expect(find.text('Customer Profile'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(3));
      expect(find.byType(Switch), findsOneWidget);
      expect(find.text('Save Settings'), findsOneWidget);
    });

    testWidgets('Toggling switch and saving settings updates state', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));
      await tester.pumpAndSettle();

      final Finder nameField = find.widgetWithText(TextField, 'Full name');
      final Finder addressField =
          find.widgetWithText(TextField, 'Delivery address');
      final Finder emailField = find.widgetWithText(TextField, 'Email address');

      await tester.enterText(nameField, 'Gerald Vernon-Jackson');
      await tester.enterText(addressField, 'Guildhall, PO1 2AJ');
      await tester.enterText(
        emailField,
        'gerald.vernon-jackson@portsmouthcc.gov.uk',
      );

      final Finder switchFinder = find.byType(Switch);
      expect(tester.widget<Switch>(switchFinder).value, isFalse);
      await tester.tap(switchFinder);
      await tester.pump();
      expect(tester.widget<Switch>(switchFinder).value, isTrue);

      await tester.tap(find.text('Save Settings'));
      await tester.pumpAndSettle();

      expect(
        find.text('Settings saved for Gerald Vernon-Jackson'),
        findsOneWidget,
      );

      final SharedPreferencesAsync prefs = SharedPreferencesAsync();
      expect(await prefs.getString(prefName), 'Gerald Vernon-Jackson');
      expect(await prefs.getString(prefAddress), 'Guildhall, PO1 2AJ');
      expect(
        await prefs.getString(prefEmail),
        'gerald.vernon-jackson@portsmouthcc.gov.uk',
      );
      expect(await prefs.getBool(prefNewsletter), isTrue);
    });

    testWidgets('SettingsScreen pre-fills saved settings on open', (
      WidgetTester tester,
    ) async {
      SharedPreferencesAsyncPlatform.instance =
          InMemorySharedPreferencesAsync.withData(<String, Object>{
        prefName: 'Abdul Kadir',
        prefAddress: 'Portsmouth Guildhall, PO1 2AJ',
        prefEmail: 'abdul.kadir@portsmouthcc.gov.uk',
        prefNewsletter: true,
      });

      await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));
      await tester.pumpAndSettle();

      expect(find.text('Abdul Kadir'), findsOneWidget);
      expect(find.text('Portsmouth Guildhall, PO1 2AJ'), findsOneWidget);
      expect(find.text('abdul.kadir@portsmouthcc.gov.uk'), findsOneWidget);
      final Switch switchWidget = tester.widget<Switch>(find.byType(Switch));
      expect(switchWidget.value, isTrue);
    });
  });
}
