import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/model/user_settings.dart';

void main() {
  group('UserSettings', () {
    test('defaults to empty values', () {
      const UserSettings settings = UserSettings();

      expect(settings.name, isEmpty);
      expect(settings.address, isEmpty);
      expect(settings.email, isEmpty);
      expect(settings.recieveNewsletter, isFalse);
    });

    test('stores configured values', () {
      const UserSettings settings = UserSettings(
        name: 'Valentino Fernandes',
        address: '39 tennyson road',
        email: 'valentinofernandes06@outlook.com',
        recieveNewsletter: true,
      );

      expect(settings.name, 'Valentino Fernandes');
      expect(settings.address, '39 tennyson road');
      expect(settings.email, 'valentinofernandes06@outlook.com');
      expect(settings.recieveNewsletter, isTrue);
    });

    test('UserSetting alias behaves the same', () {
      const UserSetting settings = UserSetting(
        name: 'Valentino Fernandes',
        address: '39 tennyson road',
        email: 'valentinofernandes06@outlook.com',
        receiveNewsletter: true,
      );

      expect(settings.name, 'Valentino Fernandes');
      expect(settings.address, '39 tennyson road');
      expect(settings.email, 'valentinofernandes06@outlook.com');
      expect(settings.recieveNewsletter, isTrue);
    });
  });
}

