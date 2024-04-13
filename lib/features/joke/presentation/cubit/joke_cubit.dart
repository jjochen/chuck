import 'package:bloc/bloc.dart';
import 'package:chuck/features/joke/domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'joke_state.dart';

class JokeCubit extends Cubit<JokeState> {
  JokeCubit({required this.getRandomJokeUseCase}) : super(const JokeInitial());
  final GetRandomJoke getRandomJokeUseCase;

  Future<void> getRandomJoke() async {
    emit(const JokeLoading());
    final result = await getRandomJokeUseCase();
    final joke = result.value;
    if (result.isSuccess && joke != null) {
      emit(JokeLoaded(joke));
    } else {
      emit(const JokeError('Failed to get joke'));
    }
  }
}
