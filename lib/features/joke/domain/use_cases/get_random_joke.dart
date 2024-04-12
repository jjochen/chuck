import 'package:chuck/core/use_cases/use_case.dart';
import 'package:chuck/features/joke/domain/entities/joke.dart';
import 'package:chuck/features/joke/domain/repositories/joke_repository.dart';

class GetRandomJoke extends UseCase<Joke> {
  const GetRandomJoke({required this.repository});

  final JokeRepository repository;

  @override
  Future<Joke> call() async {
    return repository.getRandomJoke();
  }
}
