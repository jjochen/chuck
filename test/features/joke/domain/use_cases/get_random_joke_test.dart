import 'package:chuck/core/error_handling/result.dart';
import 'package:chuck/features/joke/domain/entities/joke.dart';
import 'package:chuck/features/joke/domain/repositories/joke_repository.dart';
import 'package:chuck/features/joke/domain/use_cases/get_random_joke.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixtures.dart';
import '../../../../mocks/mocktail.dart';

void main() {
  group('GetRandomJoke', () {
    late GetRandomJoke getRandomJoke;
    late JokeRepository jokeRepository;

    setUp(() {
      jokeRepository = MockJokeRepository();
      getRandomJoke = GetRandomJoke(repository: jokeRepository);
    });

    testWidgets('returns a joke', (tester) async {
      when(() => jokeRepository.getRandomJoke()).thenAnswer(
        (_) async => testJokeResult,
      );

      final result = await getRandomJoke();

      expect(result, isA<Success<Joke>>());
      final success = result as Success<Joke>;
      expect(success.value, testJoke);
    });
  });
}
