import 'package:southsea_cinema/model/film.dart';

class BasketItem {
  final Film film;
  final int quantity;

  const BasketItem({
    required this.film,
    required this.quantity,
  });

  double get lineTotal {
    return film.price * quantity;
  }
}
