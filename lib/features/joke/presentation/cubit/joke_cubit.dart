import 'package:bloc/bloc.dart';
import 'package:chuck/core/error_handling/result.dart';
import 'package:chuck/features/joke/domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'joke_state.dart';

class JokeCubit extends Cubit<JokeState> {
  JokeCubit({required this.getRandomJokeUseCase}) : super(const JokeInitial());
  final GetRandomJoke getRandomJokeUseCase;

  Future<void> getRandomJoke() async {
    emit(const JokeLoading());
    final result = await getRandomJokeUseCase();
    switch (result) {
      case Success<Joke>(value: final joke):
        emit(JokeLoaded(joke));
      case Failure<Joke>():
        emit(
          const JokeError(
            'Oops! The connection was kicked out by Chuck Norris.\n'
            'Try reconnecting!',
          ),
        );
    }
  }
}
