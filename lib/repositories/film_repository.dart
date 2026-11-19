import 'dart:convert';
import 'package:southsea_cinema/model/film.dart';
import 'package:flutter/services.dart';

class FilmRepository {
  List<Film>? _cachedFilms;

  List<Film> getFilms() {
        final List<Film>? cachedFilms = _cachedFilms;
    if (cachedFilms != null) {
      return cachedFilms;
    }


    return const [
      Film(
        id: "bullet train",
        name: "Bullet Train",
        description:
            "Based on the 2010 Japanese novel it centers around a group of assassins on a Japanese high-speed train who end up in conflict with each other.",
        ageRating: "Rated 15",
        runTime: "2 hours, 6 minutes",
        screeningTime: "october 31st 2026, 18:30",
        price: 10.00,
        imagePath: "assets/images/bullet_train_poster.jpeg",
      ),
      Film(
        id: "superman",
        name: "Superman (2025)",
        description:
            "Superman faces unintended consequences after he intervenes in an international conflict orchestrated by billionaire Lex Luthor (Hoult).",
        ageRating: "PG 13",
        runTime: "2 hours, 9 minutes",
        screeningTime: "november 4th 2026, 20:45",
        price: 10.00,
        imagePath: "assets/images/superman_poster.jpg",
      ),
    ];
  }

  Film? getFilmById(String id) {


    for (final film in getFilms()) {
      if (film.id == id) {
        return film;
      }
    }
    return null;
  }

  Future<List<Film>> loadFilmsFromAssets({
    String assetPath = "assets/data/films.json",
  }) async {
    final String jsonString = await rootBundle.loadString(assetPath);
    final dynamic decodedData = jsonDecode(jsonString);
    final List<dynamic> jsonList = decodedData as List<dynamic>;
    final List<Film> loadedFilms = [];

    for (final dynamic item in jsonList) {
      final Map<String, dynamic> itemMap = item as Map<String, dynamic>;
      final Film film = Film.fromJson(itemMap);
      loadedFilms.add(film);
    }

    _cachedFilms = loadedFilms;
    return loadedFilms;
  }

}
