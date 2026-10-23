import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/model/film.dart';
import 'package:southsea_cinema/repositories/film_repository.dart';
import 'package:southsea_cinema/widgets/film_card.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final FilmRepository repository = FilmRepository();
    final List<Film> films = repository.getFilms();

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        centerTitle: true,
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: films.length,
              itemBuilder: (context, index) {
                return FilmCard(film: films[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
