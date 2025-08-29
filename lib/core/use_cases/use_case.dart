import 'package:chuck/core/error_handling/error_handling.dart';

abstract class UseCase<T> {
  const UseCase();

  Future<Result<T>> call();
}
