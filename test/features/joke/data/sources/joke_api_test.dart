import 'package:chuck/features/joke/data/dtos/joke_dto.dart';
import 'package:chuck/features/joke/data/sources/joke_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  group('JokeApi', () {
    late Dio dio;
    late DioAdapter dioAdapter;
    late JokeApi api;

    setUp(() {
      dio = Dio();
      dioAdapter = DioAdapter(dio: dio);
      api = JokeApi(dio);
    });

    test('should return a joke on success', () async {
      dioAdapter.onGet(
        '/jokes/random',
        (server) => server.reply(
          200,
          {
            'icon_url': 'iconUrl',
            'id': 'id',
            'url': 'url',
            'value': 'value',
          },
        ),
      );

      final result = await api.getRandomJoke();
      expect(result, isA<JokeDto>());
      expect(result.iconUrl, 'iconUrl');
      expect(result.id, 'id');
      expect(result.url, 'url');
      expect(result.value, 'value');
    });

    test('should throw an exception on server error', () async {
      dioAdapter.onGet(
        '/jokes/random',
        (server) => server.throws(
          500,
          DioException(
            requestOptions: RequestOptions(path: '/jokes/random'),
            response: Response(
              statusCode: 500,
              requestOptions: RequestOptions(path: '/jokes/random'),
            ),
          ),
        ),
      );
      expect(() => api.getRandomJoke(), throwsA(isA<DioException>()));
    });

    test('should throw an exception when data is null', () async {
      dioAdapter.onGet(
        '/jokes/random',
        (server) => server.reply(200, null),
      );
      expect(() => api.getRandomJoke(), throwsA(isA<TypeError>()));
    });

    test('should throw an exception on incomplete data', () async {
      dioAdapter.onGet(
        '/jokes/random',
        (server) => server.reply(
          200,
          {
            'icon_url': 'iconUrl',
            'id': 'id',
            'url': 'url',
          },
        ),
      );
      expect(() => api.getRandomJoke(), throwsA(isA<FormatException>()));
    });
  });
}
