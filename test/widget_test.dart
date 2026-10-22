import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/views/home_view.dart';

void main() {
  group("App tests", () {
    testWidgets("App displays the home screen", (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      expect(find.byType(HomeView), findsOneWidget);
      expect(find.text("Welcome to Southsea Cinema"), findsOneWidget);
    });

    testWidgets("Film cards show titles and booking",
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      expect(find.text("BULLET TRAIN"), findsOneWidget);
      expect(find.text("BOOK NOW"), findsNWidgets(2));
      expect(find.text("SUPERMAN (2025)"), findsOneWidget);
      expect(find.text("BOOK NOW"), findsAtLeastNWidgets(1));
    });
  });
}
