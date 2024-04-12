abstract class UseCase<Type> {
  const UseCase();

  Future<Type> call();
}
