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
      expect(result.isSuccess, isTrue);
      expect(result.value, testJokeModel);
      expect(result.exception, isNull);
    });

    test('should return a server failure on failure', () async {
      when(() => dio.get<Map<String, dynamic>>(any())).thenThrow(Exception());
      // Act
      final result = await dataSource.getRandomJoke();

      // Assert
      expect(result.isSuccess, isFalse);
      expect(result.value, isNull);
      expect(result.exception, isA<Exception>());
    });
  });
}
