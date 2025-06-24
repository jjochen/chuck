import 'package:chuck/core/error_handling/result.dart';
import 'package:test/test.dart';

void main() {
  group('Result', () {
    test('should create a successful result', () {
      const result = Success<int>(42);
      expect(result, isA<Success<int>>());
      expect(result.value, 42);
    });

    test('should create a failure result', () {
      final result = Failure<int>(Exception('error message'));
      expect(result, isA<Failure<int>>());
      expect(result.exception, isA<Exception>());
    });
  });
}
