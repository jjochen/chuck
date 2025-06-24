import 'package:chuck/core/error_handling/error_handling.dart';
import 'package:chuck/features/joke/data/data.dart';
import 'package:chuck/features/joke/domain/domain.dart';

const testJoke = Joke(
  iconUrl: 'iconUrl',
  id: 'id',
  url: 'url',
  value: 'value',
);

const testJokeDto = JokeDto(
  iconUrl: 'iconUrl',
  id: 'id',
  url: 'url',
  value: 'value',
);

const testJokeResult = Result<Joke>.success(testJoke);
final testExceptionResult = Result<Joke>.failure(Exception('error message'));
