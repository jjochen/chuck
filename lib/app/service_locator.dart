import 'package:chuck/features/joke/joke.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

class ServiceLocator {
  static void setup() {
    getIt
      ..registerLazySingleton<Dio>(
        Dio.new,
      )
      ..registerLazySingleton<JokeApi>(
        () => JokeApi(getIt()),
      )
      ..registerLazySingleton<RemoteJokeDataSource>(
        () => RemoteJokeDataSourceImpl(api: getIt()),
      )
      ..registerLazySingleton<JokeRepository>(
        () => JokeRepositoryImpl(remoteJokeDataSource: getIt()),
      )
      ..registerLazySingleton<GetRandomJoke>(
        () => GetRandomJoke(repository: getIt()),
      );
  }
}
