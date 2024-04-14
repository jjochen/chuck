import 'package:chuck/features/joke/joke.dart';
import 'package:flutter/material.dart';

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
      home: const JokeDetailPage(),
    );
  }
}
