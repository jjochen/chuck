import 'package:chuck/features/joke/domain/domain.dart';
import 'package:chuck/features/joke/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JokeDetailPage extends StatelessWidget {
  const JokeDetailPage({
    required this.getRandomJoke,
    super.key,
  });

  final GetRandomJoke getRandomJoke;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JokeCubit(
        getRandomJokeUseCase: getRandomJoke,
      ),
      child: const JokeDetailPageContent(),
    );
  }
}

class JokeDetailPageContent extends StatelessWidget {
  const JokeDetailPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuck Norris Jokes'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: BlocBuilder<JokeCubit, JokeState>(
        builder: (context, state) {
          if (state is JokeLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    state.joke.value,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<JokeCubit>().getRandomJoke();
        },
        tooltip: 'refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
