import 'package:chuck/core/core.dart';
import 'package:chuck/features/joke/joke.dart';

export 'joke_api.dart';

abstract class RemoteJokeDataSource {
  Future<Result<Joke>> getRandomJoke();
}

class RemoteJokeDataSourceImpl implements RemoteJokeDataSource {
  const RemoteJokeDataSourceImpl({required this.api});

  final JokeApi api;

  @override
  Future<Result<JokeDto>> getRandomJoke() async {
    try {
      final joke = await api.getRandomJoke();
      return Success(joke);
    } on Exception catch (exception) {
      return Failure(exception);
    }
  }
}
