import 'package:bloc_test/bloc_test.dart';
import 'package:chuck/features/joke/joke.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixtures.dart';

class MockGetRandomJoke extends Mock implements GetRandomJoke {}

void main() {
  group('JokeCubit', () {
    late JokeCubit jokeCubit;
    late GetRandomJoke getRandomJoke;

    setUp(() {
      getRandomJoke = MockGetRandomJoke();
      jokeCubit = JokeCubit(getRandomJokeUseCase: getRandomJoke);
    });

    test('initial state should be JokeInitial', () {
      expect(jokeCubit.state, equals(const JokeInitial()));
    });

    group('getRandomJoke', () {
      blocTest<JokeCubit, JokeState>(
        'emits [JokeLoading, JokeLoaded] when GetRandomJoke succeeds',
        setUp: () {
          when(() => getRandomJoke()).thenAnswer((_) async => testJokeResult);
        },
        build: () => jokeCubit,
        act: (cubit) => cubit.getRandomJoke(),
        expect: () => const [
          JokeLoading(),
          JokeLoaded(testJoke),
        ],
        verify: (bloc) => verify(() => getRandomJoke()).called(1),
      );

      blocTest<JokeCubit, JokeState>(
        'emits [JokeLoading, JokeError] when GetRandomJoke fails',
        setUp: () {
          when(() => getRandomJoke())
              .thenAnswer((_) async => testExceptionResult);
        },
        build: () => jokeCubit,
        act: (cubit) => cubit.getRandomJoke(),
        expect: () => <Matcher>[
          isA<JokeLoading>(),
          isA<JokeError>(),
        ],
      );
    });
  });
}
