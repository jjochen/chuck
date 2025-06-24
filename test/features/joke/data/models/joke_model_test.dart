import 'package:chuck/features/joke/data/dtos/joke_dto.dart';
import 'package:chuck/features/joke/domain/domain.dart';
import 'package:test/test.dart';

void main() {
  group('JokeModel', () {
    test('should be an instance of JokeModel', () {
      const jokeModel = JokeDto(
        iconUrl: 'iconUrl',
        id: 'id',
        url: 'url',
        value: 'value',
      );
      expect(jokeModel, isA<JokeDto>());
    });

    test('should be a subclass of Joke', () {
      const jokeModel = JokeDto(
        iconUrl: 'iconUrl',
        id: 'id',
        url: 'url',
        value: 'value',
      );
      expect(jokeModel, isA<Joke>());
    });

    test('should be able to convert from json', () {
      final jokeModel = JokeDto.fromJson(const {
        'icon_url': 'iconUrl',
        'id': 'id',
        'url': 'url',
        'value': 'value',
      });
      expect(jokeModel, isA<JokeDto>());
      expect(jokeModel.iconUrl, 'iconUrl');
      expect(jokeModel.id, 'id');
      expect(jokeModel.url, 'url');
      expect(jokeModel.value, 'value');
    });

    test('should be able to convert to json', () {
      const jokeModel = JokeDto(
        iconUrl: 'iconUrl',
        id: 'id',
        url: 'url',
        value: 'value',
      );
      final json = jokeModel.toJson();
      expect(json, isA<Map<String, dynamic>>());
      expect(json['icon_url'], 'iconUrl');
      expect(json['id'], 'id');
      expect(json['url'], 'url');
      expect(json['value'], 'value');
    });
  });
}
