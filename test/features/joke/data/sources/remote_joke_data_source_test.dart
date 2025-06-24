import 'package:chuck/core/error_handling/result.dart';
import 'package:chuck/features/joke/data/data.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixtures.dart';
import '../../../../mocks/mocktail.dart';

void main() {
  group('RemoteJokeDataSourceImpl', () {
    late Dio dio;
    late RemoteJokeDataSourceImpl dataSource;

    setUp(() {
      dio = MockDio();
      dataSource = RemoteJokeDataSourceImpl(dio: dio);
    });

    test('should return a joke on success', () async {
      when(() => dio.get<Map<String, dynamic>>(any())).thenAnswer(
        (_) async => Response(
          data: {
            'icon_url': 'iconUrl',
            'id': 'id',
            'url': 'url',
            'value': 'value',
          },
          requestOptions: RequestOptions(),
        ),
      );
      // Act
      final result = await dataSource.getRandomJoke();

      // Assert
      expect(result, isA<Success<JokeDto>>());
      final success = result as Success<JokeDto>;
      expect(success.value, testJokeDto);
    });

    test('should return a server failure on failure', () async {
      when(() => dio.get<Map<String, dynamic>>(any())).thenThrow(Exception());
      // Act
      final result = await dataSource.getRandomJoke();

      // Assert
      expect(result, isA<Failure<JokeDto>>());
      final failure = result as Failure<JokeDto>;
      expect(failure.exception, isA<Exception>());
    });

    test('should return a failure when data is null', () async {
      when(() => dio.get<Map<String, dynamic>>(any())).thenAnswer(
        (_) async => Response(
          // allow redundant argument values for better test readability
          // ignore: avoid_redundant_argument_values
          data: null,
          requestOptions: RequestOptions(),
        ),
      );
      // Act
      final result = await dataSource.getRandomJoke();

      // Assert
      expect(result, isA<Failure<JokeDto>>());
      final failure = result as Failure<JokeDto>;
      expect(failure.exception, isA<Exception>());
    });

    test('should return a failure on incomplete data', () async {
      when(() => dio.get<Map<String, dynamic>>(any())).thenAnswer(
        (_) async => Response(
          data: {
            'icon_url': 'iconUrl',
            'id': 'id',
            'url': 'url',
          },
          requestOptions: RequestOptions(),
        ),
      );

      // Act
      final result = await dataSource.getRandomJoke();

      // Assert
      expect(result, isA<Failure<JokeDto>>());
      final failure = result as Failure<JokeDto>;
      expect(failure.exception, isA<FormatException>());
    });
  });
}
