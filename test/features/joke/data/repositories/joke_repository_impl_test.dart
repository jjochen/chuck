import 'package:chuck/features/joke/data/data_sources/remote_joke_data_source.dart';
import 'package:chuck/features/joke/data/repositories/joke_repository_impl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../fixtures/fixtures.dart';

class RemoteJokeDataSourceMock extends Mock implements RemoteJokeDataSource {}

void main() {
  group('JokeRepositoryImpl', () {
    late JokeRepositoryImpl jokeRepository;
    late RemoteJokeDataSource remoteJokeDataSource;

    setUp(() {
      remoteJokeDataSource = RemoteJokeDataSourceMock();
      jokeRepository = JokeRepositoryImpl(
        remoteJokeDataSource: remoteJokeDataSource,
      );
    });

    test('should fetch a random joke', () async {
      when(() => remoteJokeDataSource.getRandomJoke()).thenAnswer(
        (_) async => testJokeResult,
      );

      final result = await jokeRepository.getRandomJoke();
      expect(result.value, testJoke);
    });
  });
}
