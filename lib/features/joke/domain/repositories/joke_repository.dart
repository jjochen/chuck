import 'package:chuck/features/joke/domain/entities/joke.dart';

abstract class JokeRepository {
  Future<Joke> getRandomJoke();
}
