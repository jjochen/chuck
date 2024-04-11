import 'package:chuck/features/joke/domain/repositories/joke_repository.dart';
import 'package:chuck/features/joke/domain/use_cases/get_random_joke.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixtures.dart';

class JokeRepositoryMock extends Mock implements JokeRepository {}

void main() {
  group('GetRandomJoke', () {
    late GetRandomJoke getRandomJoke;
    late JokeRepository jokeRepository;

    setUp(() {
      jokeRepository = JokeRepositoryMock();
      getRandomJoke = GetRandomJoke(repository: jokeRepository);
    });

    testWidgets('returns a joke', (tester) async {
      when(() => jokeRepository.getRandomJoke()).thenAnswer(
        (_) async => testJokeResult,
      );

      final result = await getRandomJoke();

      expect(result.value, testJoke);
    });
  });
}
