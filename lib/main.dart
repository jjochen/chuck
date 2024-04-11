import 'package:chuck/features/joke/joke.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
      home: JokeDetailPage(
        getRandomJoke: GetRandomJoke(
          repository: JokeRepositoryImpl(
            remoteJokeDataSource: RemoteJokeDataSourceImpl(
              dio: Dio(),
            ),
          ),
        ),
      ),
    );
  }
}
