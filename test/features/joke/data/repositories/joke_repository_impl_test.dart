import 'package:chuck/features/joke/data/repositories/joke_repository_impl.dart';
import 'package:chuck/features/joke/data/sources/remote_joke_data_source.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../fixtures/fixtures.dart';
import '../../../../mocks/mocktail.dart';

void main() {
  group('JokeRepositoryImpl', () {
    late JokeRepositoryImpl jokeRepository;
    late RemoteJokeDataSource remoteJokeDataSource;

    setUp(() {
      remoteJokeDataSource = MockRemoteJokeDataSource();
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
