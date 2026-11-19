import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/repositories/film_repository.dart';
import 'package:southsea_cinema/model/film.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
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
  
    test('loadFilmsFromAsset reads the bundled JSON menu', () async {
      final FilmRepository repository = FilmRepository();
      final List<Film> films =
          await repository.loadFilmsFromAsset();

      expect(films.length, 2);
      expect(films[0].id, 'bullet train');
      expect(films[1].id, 'superman');
      expect(films[2].id, 'love and monsters');
      expect(films[2].price, 10.00);
      expect(films[2].imagePath, 'assets/images/love_and_monster_poster.jpg');
      expect(films[3].id, 'fake film');
      expect(films[3].price, 0.0);
      expect(repository.getFilms(), films);
    });
  });
}
