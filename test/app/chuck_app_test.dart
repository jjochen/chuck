import 'package:chuck/app/chuck_app.dart';
import 'package:chuck/features/joke/joke.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../fixtures/fixtures.dart';
import '../mocks/mocktail.dart';

void main() {
  group('ChuckApp', () {
    late GetRandomJoke getRandomJoke;

    setUp(() {
      getRandomJoke = MockGetRandomJoke();
      when(() => getRandomJoke()).thenAnswer((_) async => testJokeResult);
      GetIt.instance.registerSingleton<GetRandomJoke>(getRandomJoke);
    });

    testWidgets('should render JokeDetailPage', (WidgetTester tester) async {
      await tester.pumpWidget(const ChuckApp());

      expect(find.byType(JokeDetailPage), findsOneWidget);
    });
  });
}
