import 'package:chuck/features/joke/joke.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static void setup() {
    getIt
      ..registerLazySingleton<Dio>(
        Dio.new,
      )
      ..registerLazySingleton<RemoteJokeDataSource>(
        () => RemoteJokeDataSourceImpl(dio: getIt()),
      )
      ..registerLazySingleton<JokeRepository>(
        () => JokeRepositoryImpl(remoteJokeDataSource: getIt()),
      )
      ..registerLazySingleton<GetRandomJoke>(
        () => GetRandomJoke(repository: getIt()),
      );
  }
}
