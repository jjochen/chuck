import 'package:chuck/features/joke/data/data.dart';
import 'package:chuck/features/joke/domain/domain.dart';
import 'package:dio/dio.dart';

abstract class RemoteJokeDataSource {
  const RemoteJokeDataSource();

  Future<Joke?> getRandomJoke();
}

class RemoteJokeDataSourceImpl implements RemoteJokeDataSource {
  const RemoteJokeDataSourceImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<JokeModel?> getRandomJoke() async {
    try {
      final response = await dio.get('https://api.chucknorris.io/jokes/random');
      final joke = JokeModel.fromJson(response.data as Map<String, dynamic>);
      return joke;
    } catch (e) {
      // TODO(jjochen): better error handling, e.g. throw exception
      return null;
    }
  }
}
