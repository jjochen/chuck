import 'package:chuck/features/joke/joke.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const ChuckApp());
}

class ChuckApp extends StatelessWidget {
  const ChuckApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chuck Norris Jokes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<JokeRepository>(
            create: (context) => JokeRepositoryImpl(
              remoteJokeDataSource: RemoteJokeDataSourceImpl(
                dio: Dio(),
              ),
            ),
          ),
          RepositoryProvider(
            create: (context) => GetRandomJoke(
              repository: context.read<JokeRepository>(),
            ),
          ),
        ],
        child: const JokeDetailPage(),
      ),
    );
  }
}
