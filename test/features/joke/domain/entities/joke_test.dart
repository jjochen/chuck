import 'package:chuck/features/joke/domain/entities/joke.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Joke', () {
    test('should be able to create a Joke instance', () {
      const joke = Joke(
        iconUrl: 'iconUrl',
        id: 'id',
        url: 'url',
        value: 'value',
      );

      expect(joke, isA<Joke>());
    });

    test('should return the correct values', () {
      const joke = Joke(
        iconUrl: 'iconUrl',
        id: 'id',
        url: 'url',
        value: 'value',
      );

      expect(joke.iconUrl, 'iconUrl');
      expect(joke.id, 'id');
      expect(joke.url, 'url');
      expect(joke.value, 'value');
    });

    test('should support value equality', () {
      expect(
        const Joke(
          iconUrl: 'iconUrl',
          id: 'id',
          url: 'url',
          value: 'value',
        ),
        const Joke(
          iconUrl: 'iconUrl',
          id: 'id',
          url: 'url',
          value: 'value',
        ),
      );

      expect(
        const Joke(
          iconUrl: 'iconUrl',
          id: 'id',
          url: 'url',
          value: 'value',
        ),
        isNot(
          const Joke(
            iconUrl: 'iconUrl2',
            id: 'id',
            url: 'url',
            value: 'value',
          ),
        ),
      );

      expect(
        const Joke(
          iconUrl: 'iconUrl',
          id: 'id',
          url: 'url',
          value: 'value',
        ),
        isNot(
          const Joke(
            iconUrl: 'iconUrl',
            id: 'id2',
            url: 'url',
            value: 'value',
          ),
        ),
      );

      expect(
        const Joke(
          iconUrl: 'iconUrl',
          id: 'id',
          url: 'url',
          value: 'value',
        ),
        isNot(
          const Joke(
            iconUrl: 'iconUrl',
            id: 'id',
            url: 'url2',
            value: 'value',
          ),
        ),
      );

      expect(
        const Joke(
          iconUrl: 'iconUrl',
          id: 'id',
          url: 'url',
          value: 'value',
        ),
        isNot(
          const Joke(
            iconUrl: 'iconUrl',
            id: 'id',
            url: 'url',
            value: 'value2',
          ),
        ),
      );
    });
  });
}
