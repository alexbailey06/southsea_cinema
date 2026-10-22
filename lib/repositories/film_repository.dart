import 'package:southsea_cinema/model/film.dart';

class FilmRepository {
  List<Film> getFilms() {
    return const [
      Film(
        id: "1",
        name: "Bullet Train",
        description:
            "Based on the 2010 Japanese novel it centers around a group of assassins on a Japanese high-speed train who end up in conflict with each other.",
        ageRating: "Rated 15",
        runTime: "2 hours, 6 minutes",
        screeningTime: "6:30",
        price: 10.0,
        imagePath: "assets/images/bullet_train_poster.jpeg",
      ),
      Film(
        id: "2",
        name: "Superman (2025)",
        description:
            "Superman faces unintended consequences after he intervenes in an international conflict orchestrated by billionaire Lex Luthor (Hoult).",
        ageRating: "PG 13",
        runTime: "2 hours, 9 minutes",
        screeningTime: "8:45",
        price: 10.0,
        imagePath: "assets/images/superman_poster.jpg",
      ),
    ];
  }
}
