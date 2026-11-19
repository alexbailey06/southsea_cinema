import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:flutter/material.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

void main() {
  group("App tests", () {
    testWidgets("Film cards show titles and booking",
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      expect(find.text("BULLET TRAIN"), findsOneWidget);
      expect(find.text("Book Now"), findsNWidgets(2));
      expect(find.text("SUPERMAN (2025)"), findsOneWidget);
      expect(find.text("Book Now"), findsAtLeastNWidgets(1));
    });

    testWidgets('Purchasing tickets adds them to the basket',
        (WidgetTester tester) async {
      final basket = BasketRepository.instance;
      basket.clear();
      addTearDown(basket.clear);

      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.tap(find.text('Book Now').first);
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('Press to Purchase'));
      await tester.tap(find.text('Press to Purchase'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      expect(basket.totalItemCount, 5);

      await tester.tap(find.byTooltip('Open navigation menu'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('My Basket'));
      await tester.pumpAndSettle();

      expect(find.text('5 x Bullet Train'), findsOneWidget);
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
