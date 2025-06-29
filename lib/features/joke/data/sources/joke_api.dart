import 'package:chuck/features/joke/joke.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'joke_api.g.dart';

@RestApi(baseUrl: 'https://api.chucknorris.io')
abstract class JokeApi {
  factory JokeApi(Dio dio, {String baseUrl}) = _JokeApi;

  @GET('/jokes/random')
  Future<JokeDto> getRandomJoke();
}
