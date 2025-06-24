import 'package:chuck/core/extensions/json_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('JsonMap', () {
    group('get<T>', () {
      test('should return correct value when key exists and type matches', () {
        final json = {
          'string_key': 'test_value',
          'int_key': 42,
          'bool_key': true,
          'double_key': 3.14,
        };

        expect(json.get<String>('string_key'), 'test_value');
        expect(json.get<int>('int_key'), 42);
        expect(json.get<bool>('bool_key'), true);
        expect(json.get<double>('double_key'), 3.14);
      });

      test(
        'should return null for nullable type with null value',
        () {
          final json = {'null_key': null};
          expect(json.get<String?>('null_key'), isNull);
          expect(json.get<int?>('null_key'), isNull);
          expect(json.get<bool?>('null_key'), isNull);
          expect(json.get<double?>('null_key'), isNull);
        },
      );

      test('should return null for non existing keys with nullable type', () {
        final json = <String, dynamic>{};
        expect(json.get<String?>('null_key'), isNull);
      });

      test('should throw FormatException when key does not exist', () {
        final json = {'existing_key': 'value'};

        expect(
          () => json.get<String>('non_existent_key'),
          throwsA(isA<FormatException>()),
        );
      });

      test(
        'should throw FormatException when key exists but type does not match',
        () {
          final json = {'string_key': 'test_value'};

          expect(
            () => json.get<int>('string_key'),
            throwsA(isA<FormatException>()),
          );
        },
      );

      test('should throw FormatException when value is null', () {
        final json = {'null_key': null};

        expect(
          () => json.get<String>('null_key'),
          throwsA(isA<FormatException>()),
        );
      });

      test('should handle nested maps correctly', () {
        final json = {
          'nested': {'inner_key': 'inner_value'},
        };

        final nested = json.get<Map<String, dynamic>>('nested');
        expect(nested.get<String>('inner_key'), 'inner_value');
      });

      test('should handle lists correctly', () {
        final json = {
          'list_key': ['item1', 'item2', 'item3'],
        };

        final list = json.get<List<dynamic>>('list_key');
        expect(list, ['item1', 'item2', 'item3']);
      });
    });

    group('getOrNull<T>', () {
      test('should return correct value when key exists and type matches', () {
        final json = {
          'string_key': 'test_value',
          'int_key': 42,
          'bool_key': true,
        };

        expect(json.getOrNull<String>('string_key'), 'test_value');
        expect(json.getOrNull<int>('int_key'), 42);
        expect(json.getOrNull<bool>('bool_key'), true);
      });

      test('should return null when key does not exist', () {
        final json = {'existing_key': 'value'};

        expect(json.getOrNull<String>('non_existent_key'), isNull);
      });

      test('should return null when key exists but type does not match', () {
        final json = {'string_key': 'test_value'};

        expect(json.getOrNull<int>('string_key'), isNull);
      });

      test('should return null when value is null', () {
        final json = {'null_key': null};

        expect(json.getOrNull<String>('null_key'), isNull);
      });

      test('should handle nested maps correctly', () {
        final json = {
          'nested': {'inner_key': 'inner_value'},
        };

        final nested = json.getOrNull<Map<String, dynamic>>('nested');
        expect(nested?.getOrNull<String>('inner_key'), 'inner_value');
      });

      test('should handle lists correctly', () {
        final json = {
          'list_key': ['item1', 'item2'],
        };

        final list = json.getOrNull<List<dynamic>>('list_key');
        expect(list, ['item1', 'item2']);
      });

      test('should return null for non-existent nested key', () {
        final json = {
          'nested': {'inner_key': 'inner_value'},
        };

        final nested = json.getOrNull<Map<String, dynamic>>('nested');
        expect(nested?.getOrNull<String>('non_existent_inner_key'), isNull);
      });
    });

    group('error messages', () {
      test('should provide clear error message in FormatException', () {
        final json = {'existing_key': 'value'};

        try {
          json.get<String>('non_existent_key');
          fail('Expected FormatException to be thrown');
        } on FormatException catch (e) {
          expect(e.message, contains('Key non_existent_key not found'));
          expect(e.message, contains('{existing_key: value}'));
        }
      });
    });
  });
}
