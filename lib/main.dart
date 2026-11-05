import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/views/basket_screen.dart';

void main() {
  runApp(const SouthseaCinemaApp());
}

class SouthseaCinemaApp extends StatelessWidget {
  const SouthseaCinemaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) {
          return const HomeView();
        },
        "/basket": (BuildContext context) {
          return const BasketScreen();
        }
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: cinemaBrand,
          primary: cinemaBrand,
        ),
        scaffoldBackgroundColor: cinemaBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: cinemaSurface,
          foregroundColor: cinemaFontWhite,
          elevation: 0,
        ),
      ),
    );
  }
}
