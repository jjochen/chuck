import 'package:chuck/core/error_handling/result.dart';
import 'package:test/test.dart';

void main() {
  group('Result', () {
    test('should create a successful result', () {
      const result = Result<int>.success(42);

      expect(result.isSuccess, isTrue);
      expect(result.value, 42);
      expect(result.exception, isNull);
    });

    test('should create a failure result', () {
      final result = Result<int>.failure(Exception('error message'));

      expect(result.isSuccess, isFalse);
      expect(result.value, isNull);
      expect(result.exception, isA<Exception>());
    });
  });
}
