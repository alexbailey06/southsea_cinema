import 'package:southsea_cinema/model/film.dart';

class FilmRepository {
  List<Film> getFilms() {
    return const [
      Film(
        id: "1",
        name: "Bullet Train",
        description:
            "Based on the 2010 Japanese novel it centers around a group of assassins on a Japanese high-speed train who end up in conflict with each other.",
        price: "£10.00",
        imagePath: "assets/images/bullet_train.jpeg",
      ),
      Film(
        id: "2",
        name: "SuperMan(2025)",
        description:
            "Superman faces unintended consequences after he intervenes in an international conflict orchestrated by billionaire Lex Luthor (Hoult).",
        price: "£10.00",
        imagePath: "assets/images/superman.jpeg",
),
    ];
  }
}
