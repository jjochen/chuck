import 'package:chuck/core/error_handling/error_handling.dart';

abstract class UseCase<Type> {
  const UseCase();

  Future<Result<Type>> call();
}
