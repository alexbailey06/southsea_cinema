import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:flutter/material.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';
void main() {
  group("App tests", () {

    testWidgets("Film cards show titles and booking",
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      expect(find.text("BULLET TRAIN"), findsOneWidget);
      expect(find.text("BOOK NOW"), findsNWidgets(2));
      expect(find.text("SUPERMAN (2025)"), findsOneWidget);
      expect(find.text("BOOK NOW"), findsAtLeastNWidgets(1));
    });

    testWidgets('PrimaryButton renders its label', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PrimaryButton(
              label: 'Order',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Order'), findsOneWidget);
    });

    testWidgets('PrimaryButton invokes onPressed when tapped',
        (WidgetTester tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PrimaryButton(
              label: 'Order',
              onPressed: () {
                wasPressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Order'));
      await tester.pump();

      expect(wasPressed, isTrue);
    });
  });
}
