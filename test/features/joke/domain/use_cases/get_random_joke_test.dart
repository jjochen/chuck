import 'package:chuck/features/joke/domain/entities/joke.dart';
import 'package:chuck/features/joke/domain/repositories/joke_repository.dart';
import 'package:chuck/features/joke/domain/use_cases/get_random_joke.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class JokeRepositoryMock extends Mock implements JokeRepository {}

void main() {
  group('GetRandomJoke', () {
    const testJoke = Joke(
      iconUrl: 'iconUrl',
      id: 'id',
      url: 'url',
      value: 'value',
    );

    late GetRandomJoke getRandomJoke;
    late JokeRepository jokeRepository;

    setUp(() {
      jokeRepository = JokeRepositoryMock();
      getRandomJoke = GetRandomJoke(repository: jokeRepository);
    });

    testWidgets('returns a joke', (tester) async {
      when(() => jokeRepository.getRandomJoke()).thenAnswer(
        (_) async => testJoke,
      );

      final joke = await getRandomJoke();

      expect(joke, testJoke);
    });
  });
}
