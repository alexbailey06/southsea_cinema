import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/model/film.dart';

void main() {
  group('Film model tests', () {
    test('creates film instance with given properties', () {
      const film = Film(
        id: 'bullet train',
        name: 'Bullet Train',
        description:
            'Based on the 2010 Japanese novel it centers around a group of assassins on a Japanese high-speed train who end up in conflict with each other.',
        ageRating: 'Rated 15',
        runTime: '2 hours, 6 minutes',
        screeningTime: 'october 31st 2026, 18:30',
        price: 10.00,
        imagePath: 'assets/images/bullet_train_poster.jpeg',
      );

      expect(film.id, 'bullet train');
      expect(film.name, 'Bullet Train');
      expect(
        film.description,
        'Based on the 2010 Japanese novel it centers around a group of assassins on a Japanese high-speed train who end up in conflict with each other.',
      );
      expect(film.ageRating, 'Rated 15');
      expect(film.runTime, '2 hours, 6 minutes');
      expect(film.screeningTime, 'october 31st 2026, 18:30');
      expect(film.price, 10.00);
      expect(film.imagePath, 'assets/images/bullet_train_poster.jpeg');
    });
    test(
      'formattedPrice returns price prefixed with pound sign and two decimals',
      () {
      const film = Film(
          id: 'bullet train',
          name: 'Bullet Train',
          description:
              'Based on the 2010 Japanese novel it centers around a group of assassins on a Japanese high-speed train who end up in conflict with each other.',
          ageRating: 'Rated 15',
          runTime: '2 hours, 6 minutes',
          screeningTime: 'october 31st 2026, 18:30',
          price: 10.00,
          imagePath: 'assets/images/bullet_train_poster.jpeg',
        );

        expect(film.formattedPrice, '£10.00');
      },
    );
  });
}
