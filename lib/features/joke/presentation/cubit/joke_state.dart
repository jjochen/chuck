part of 'joke_cubit.dart';

sealed class JokeState extends Equatable {
  const JokeState();

  @override
  List<Object> get props => [];
}

final class JokeInitial extends JokeState {
  const JokeInitial();
}

final class JokeLoading extends JokeState {
  const JokeLoading();
}

final class JokeLoaded extends JokeState {
  const JokeLoaded(this.joke);

  final Joke joke;

  @override
  List<Object> get props => [joke];
}

final class JokeError extends JokeState {
  const JokeError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
