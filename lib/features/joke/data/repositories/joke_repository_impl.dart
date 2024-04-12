import 'package:chuck/features/joke/data/data_sources/remote_joke_data_source.dart';
import 'package:chuck/features/joke/domain/domain.dart';

class JokeRepositoryImpl implements JokeRepository {
  const JokeRepositoryImpl({
    required this.remoteJokeDataSource,
  });

  final RemoteJokeDataSource remoteJokeDataSource;

  @override
  Future<Joke?> getRandomJoke() {
    return remoteJokeDataSource.getRandomJoke();
  }
}
