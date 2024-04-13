import 'package:chuck/core/core.dart';
import 'package:chuck/features/joke/domain/entities/joke.dart';

abstract class JokeRepository {
  Future<Result<Joke>> getRandomJoke();
}
