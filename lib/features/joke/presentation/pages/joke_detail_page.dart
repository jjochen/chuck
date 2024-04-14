import 'package:chuck/features/joke/presentation/presentation.dart';
import 'package:chuck/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JokeDetailPage extends StatelessWidget {
  const JokeDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          JokeCubit(getRandomJokeUseCase: getIt())..getRandomJoke(),
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 48,
        ),
        child: BlocBuilder<JokeCubit, JokeState>(
          builder: (context, state) {
            if (state is JokeLoaded) {
              return Text(
                state.joke.value,
                style: Theme.of(context).textTheme.bodyLarge,
              );
            } else if (state is JokeError) {
              return Center(
                child: Text(
                  state.message,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<JokeCubit>().getRandomJoke(),
        tooltip: 'refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
