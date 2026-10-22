import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/repositories/film_repository.dart';

void main() {
  group('FilmRepository tests', () {
    test('getFilms returns two films', () {
      final repository = FilmRepository();

      expect(repository.getFilms(), hasLength(2));
    });

    test('getFilms contains Bullet Train and Superman', () {
      final repository = FilmRepository();
      final films = repository.getFilms();

      expect(films[0].id, 'bullet train');
      expect(films[0].name, 'Bullet Train');
      expect(films[1].id, 'superman');
      expect(films[1].name, 'Superman (2025)');
    });

    test('getFilmById returns matching film when the id exists', () {
      final repository = FilmRepository();
      final film = repository.getFilmById('bullet train');

      expect(film, isNotNull);
      expect(film?.name, 'Bullet Train');
      expect(film?.price, 10.00);
    });

    test('getFilmById returns null when the id does not exist', () {
      final repository = FilmRepository();
      final film = repository.getFilmById('non-existent');

      expect(film, isNull);
    });
  });
}
