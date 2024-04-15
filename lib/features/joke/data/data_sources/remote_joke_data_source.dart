import 'package:chuck/core/core.dart';
import 'package:chuck/features/joke/data/data.dart';
import 'package:chuck/features/joke/domain/domain.dart';
import 'package:dio/dio.dart';

abstract class RemoteJokeDataSource {
  Future<Result<Joke>> getRandomJoke();
}

class RemoteJokeDataSourceImpl implements RemoteJokeDataSource {
  const RemoteJokeDataSourceImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<Result<JokeModel>> getRandomJoke() async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        'https://api.chucknorris.io/jokes/random',
      );
      final joke = JokeModel.fromJson(response.data!);
      return Result.success(joke);
    } on Exception catch (exception) {
      return Result.failure(exception);
    }
  }
}
