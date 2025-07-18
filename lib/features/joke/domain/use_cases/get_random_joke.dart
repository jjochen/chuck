import 'package:chuck/core/error_handling/error_handling.dart';
import 'package:chuck/core/use_cases/use_case.dart';
import 'package:chuck/features/joke/domain/domain.dart';

class GetRandomJoke extends UseCase<Joke> {
  const GetRandomJoke({required this.repository});

  final JokeRepository repository;

  @override
  Future<Result<Joke>> call() async {
    return repository.getRandomJoke();
  }
}
