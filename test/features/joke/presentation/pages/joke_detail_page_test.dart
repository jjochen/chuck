// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:chuck/features/joke/joke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixtures.dart';
import '../../../../mocks/mocktail.dart';
import '../../../../utils.dart';

void main() {
  group('JokeDetailPage', () {
    late GetRandomJoke getRandomJoke;

    setUp(() {
      getRandomJoke = MockGetRandomJoke();
      when(() => getRandomJoke()).thenAnswer((_) async => testJokeResult);
      GetIt.instance.registerLazySingleton<GetRandomJoke>(() => getRandomJoke);
    });

    tearDown(() {
      GetIt.instance.reset();
    });

    testWidgets('should render joke detail page content',
        (WidgetTester tester) async {
      final widget = JokeDetailPage();

      await tester.pumpMaterialApp(widget);

      expect(find.byType(JokeDetailPageContent), findsOneWidget);
    });

    testWidgets('should call getRandomJoke when created',
        (WidgetTester tester) async {
      final widget = JokeDetailPage();

      await tester.pumpMaterialApp(widget);

      verify(getRandomJoke.call).called(1);
    });
  });

  group('JokeDetailPageContent', () {
    late JokeCubit jokeCubit;

    setUp(() {
      jokeCubit = MockJokeCubit();
      when(() => jokeCubit.getRandomJoke()).thenAnswer((_) async => testJoke);
    });

    Widget buildFrame() {
      return BlocProvider(
        create: (context) => jokeCubit,
        child: JokeDetailPageContent(),
      );
    }

    testWidgets('should render loading when state is JokeLoading',
        (WidgetTester tester) async {
      whenListen(
        jokeCubit,
        Stream.fromIterable([
          JokeLoading(),
        ]),
        initialState: const JokeInitial(),
      );
      final widget = buildFrame();
      await tester.pumpMaterialApp(widget);
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should render joke when state is JokeLoaded',
        (WidgetTester tester) async {
      whenListen(
        jokeCubit,
        Stream.fromIterable(
          [
            JokeLoading(),
            JokeLoaded(testJoke),
          ],
        ),
        initialState: const JokeInitial(),
      );

      final widget = buildFrame();
      await tester.pumpMaterialApp(widget);
      await tester.pumpAndSettle();

      expect(find.text(testJoke.value), findsOneWidget);
    });

    testWidgets('should render error message when state is JokeError',
        (WidgetTester tester) async {
      const errorMessage = 'Error!!!';
      whenListen(
        jokeCubit,
        Stream.fromIterable(
          [
            JokeLoading(),
            JokeError(errorMessage),
          ],
        ),
        initialState: const JokeInitial(),
      );

      final widget = buildFrame();
      await tester.pumpMaterialApp(widget);
      await tester.pumpAndSettle();

      expect(find.text(errorMessage), findsOneWidget);
    });

    testWidgets(
        'should call getRandomJoke when floatingActionButton is pressed',
        (WidgetTester tester) async {
      whenListen(
        jokeCubit,
        Stream.fromIterable(
          [
            JokeLoading(),
            JokeLoaded(testJoke),
          ],
        ),
        initialState: const JokeInitial(),
      );
      when(() => jokeCubit.getRandomJoke()).thenAnswer((_) async => testJoke);

      final widget = buildFrame();
      await tester.pumpMaterialApp(widget);
      await tester.pumpAndSettle();

      await tester.tap(find.byType(FloatingActionButton));
      verify(() => jokeCubit.getRandomJoke()).called(1);
    });
  });
}
