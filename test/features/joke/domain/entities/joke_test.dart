import 'package:chuck/features/joke/domain/entities/joke.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Joke', () {
    test('should be able to create a Joke instance', () {
      // Arrange
      const joke = Joke(
        iconUrl: 'iconUrl',
        id: 'id',
        url: 'url',
        value: 'value',
      );

      // Act

      // Assert
      expect(joke, isA<Joke>());
    });

    test('should return the correct values', () {
      // Arrange
      const joke = Joke(
        iconUrl: 'iconUrl',
        id: 'id',
        url: 'url',
        value: 'value',
      );

      // Act

      // Assert
      expect(joke.iconUrl, 'iconUrl');
      expect(joke.id, 'id');
      expect(joke.url, 'url');
      expect(joke.value, 'value');
    });
  });
}
