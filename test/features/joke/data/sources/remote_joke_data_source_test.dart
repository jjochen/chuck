import 'package:chuck/core/error_handling/result.dart';
import 'package:chuck/features/joke/data/data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixtures.dart';
import '../../../../mocks/mocktail.dart';

void main() {
  group('RemoteJokeDataSourceImpl', () {
    late MockJokeApi mockApi;
    late RemoteJokeDataSourceImpl dataSource;

    setUp(() {
      mockApi = MockJokeApi();
      dataSource = RemoteJokeDataSourceImpl(api: mockApi);
    });

    test('should return a joke on success', () async {
      when(() => mockApi.getRandomJoke()).thenAnswer((_) async => testJokeDto);
      final result = await dataSource.getRandomJoke();
      expect(result, isA<Success<JokeDto>>());
      final success = result as Success<JokeDto>;
      expect(success.value, testJokeDto);
    });

    test('should return a failure on exception', () async {
      when(() => mockApi.getRandomJoke()).thenThrow(Exception('error'));
      final result = await dataSource.getRandomJoke();
      expect(result, isA<Failure<JokeDto>>());
      final failure = result as Failure<JokeDto>;
      expect(failure.exception, isA<Exception>());
    });
  });
}
