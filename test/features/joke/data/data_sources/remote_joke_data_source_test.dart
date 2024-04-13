import 'package:chuck/features/joke/data/data.dart';
import 'package:chuck/features/joke/domain/domain.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('RemoteJokeDataSourceImpl', () {
    late Dio dio;
    late RemoteJokeDataSourceImpl dataSource;

    setUp(() {
      dio = MockDio();
      dataSource = RemoteJokeDataSourceImpl(dio: dio);
    });

    test('should return a joke', () async {
      when(() => dio.get(any())).thenAnswer(
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
      final joke = await dataSource.getRandomJoke();

      // Assert
      expect(joke, isA<Joke>());
    });
  });
}
