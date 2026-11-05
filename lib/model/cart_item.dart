import 'package:southsea_cinema/model/film.dart';

class CartItem {
  final Film film;
  final int quantity;

  const CartItem({
    required this.film,
    required this.quantity,
  });

  double get lineTotal {
    return film.price * quantity;
  }
}
