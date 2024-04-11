import 'package:chuck/features/joke/presentation/cubit/cubit.dart';
import 'package:test/test.dart';

import '../../../../fixtures/fixtures.dart';

void main() {
  group('JokeState', () {
    group('JokeInitial', () {
      const jokeInitial = JokeInitial();

      test('props should be empty', () {
        expect(jokeInitial.props, isEmpty);
      });
    });

    group('JokeLoading', () {
      const jokeLoading = JokeLoading();

      test('props should be empty', () {
        expect(jokeLoading.props, isEmpty);
      });
    });

    group('JokeLoaded', () {
      const jokeLoaded = JokeLoaded(testJoke);

      test('should contain the correct joke', () {
        expect(jokeLoaded.joke, testJoke);
      });

      test('props should contain joke', () {
        expect(jokeLoaded.props, contains(testJoke));
      });
    });

    group('JokeError', () {
      const errorMessage = 'An error occurred';
      const jokeError = JokeError(errorMessage);

      test('should contain the correct error message', () {
        expect(jokeError.message, errorMessage);
      });

      test('props should contain error message', () {
        expect(jokeError.props, contains(errorMessage));
      });
    });
  });
}
