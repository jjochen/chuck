import 'package:chuck/features/joke/joke.dart';
import 'package:chuck/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  ServiceLocator.setup();
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
      home: const JokeDetailPage(),
    );
  }
}
