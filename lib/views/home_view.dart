import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/model/film.dart';
import 'package:southsea_cinema/repositories/film_repository.dart';
import 'package:southsea_cinema/widgets/basket_button.dart';
import 'package:southsea_cinema/widgets/film_card.dart';
import 'package:southsea_cinema/widgets/settings_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Film> _films = [];
  bool _loading = true;
  String _errorMessage = "";

  @override
  void initState() {
    super.initState();
    _loadFilms();
  }

  Future<void> _loadFilms() async {
    try {
      final FilmRepository repository = FilmRepository();
      final List<Film> films = await repository.loadFilmsFromAsset();
      if (!mounted) {
        return;
      }
      setState(() {
        _films = films;
        _loading = false;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        _errorMessage = 'Could not load the list: $error';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget body;
    if (_loading) {
      body = const Center(child: CircularProgressIndicator());
    } else if (_errorMessage.isNotEmpty) {
      body = Center(
        child: Text(
          _errorMessage,
          style: const TextStyle(color: cinemaFontWhite, fontSize: 16),
        ),
      );
    } else {
      body = ListView.builder(
        itemCount: _films.length,
        itemBuilder: (BuildContext context, int index) {
          return FilmCard(film: _films[index]);
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text(appTitle, style: cinemaHeaderStyle),
          actions: const [SettingsButton(), BasketButton()],
        ),
        body: body);
  }
}
