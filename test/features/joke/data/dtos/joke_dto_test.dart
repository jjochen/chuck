import 'package:chuck/features/joke/data/dtos/joke_dto.dart';
import 'package:chuck/features/joke/domain/domain.dart';
import 'package:test/test.dart';

void main() {
  group('JokeDto', () {
    test('should be an instance of JokeDto', () {
      const jokeDto = JokeDto(
        iconUrl: 'iconUrl',
        id: 'id',
        url: 'url',
        value: 'value',
      );
      expect(jokeDto, isA<JokeDto>());
    });

    test('should be a subclass of Joke', () {
      const jokeDto = JokeDto(
        iconUrl: 'iconUrl',
        id: 'id',
        url: 'url',
        value: 'value',
      );
      expect(jokeDto, isA<Joke>());
    });

    test('should be able to convert from json', () {
      final jokeDto = JokeDto.fromJson(const {
        'icon_url': 'iconUrl',
        'id': 'id',
        'url': 'url',
        'value': 'value',
      });
      expect(jokeDto, isA<JokeDto>());
      expect(jokeDto.iconUrl, 'iconUrl');
      expect(jokeDto.id, 'id');
      expect(jokeDto.url, 'url');
      expect(jokeDto.value, 'value');
    });

    test('should be able to convert to json', () {
      const jokeDto = JokeDto(
        iconUrl: 'iconUrl',
        id: 'id',
        url: 'url',
        value: 'value',
      );
      final json = jokeDto.toJson();
      expect(json, isA<Map<String, dynamic>>());
      expect(json['icon_url'], 'iconUrl');
      expect(json['id'], 'id');
      expect(json['url'], 'url');
      expect(json['value'], 'value');
    });
  });
}
