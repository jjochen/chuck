import 'package:chuck/app/service_locator.dart';
import 'package:chuck/features/joke/joke.dart';
import 'package:dio/dio.dart';
import 'package:test/test.dart';

void main() {
  group('ServiceLocator.setup', () {
    test('should register dependencies', () {
      ServiceLocator.setup();

      expect(getIt<Dio>(), isA<Dio>());
      expect(getIt<RemoteJokeDataSource>(), isA<RemoteJokeDataSourceImpl>());
      expect(getIt<JokeRepository>(), isA<JokeRepositoryImpl>());
      expect(getIt<GetRandomJoke>(), isA<GetRandomJoke>());
    });
  });
}
