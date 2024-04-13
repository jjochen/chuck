import 'package:chuck/core/error_handling/error_handling.dart';
import 'package:chuck/features/joke/data/data.dart';
import 'package:chuck/features/joke/domain/domain.dart';

class JokeRepositoryImpl implements JokeRepository {
  const JokeRepositoryImpl({
    required this.remoteJokeDataSource,
  });

  final RemoteJokeDataSource remoteJokeDataSource;

  @override
  Future<Result<Joke>> getRandomJoke() {
    return remoteJokeDataSource.getRandomJoke();
  }
}
