import 'package:bloc_test/bloc_test.dart';
import 'package:chuck/features/joke/joke.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

class MockRemoteJokeDataSource extends Mock implements RemoteJokeDataSource {}

class MockJokeRepository extends Mock implements JokeRepository {}

class MockGetRandomJoke extends Mock implements GetRandomJoke {}

class MockJokeCubit extends MockCubit<JokeState> implements JokeCubit {}

class MockJokeApi extends Mock implements JokeApi {}
