class Result<Type> {
  const Result._({
    required this.isSuccess,
    this.value,
    this.exception,
  });

  const Result.success(Type value) : this._(isSuccess: true, value: value);

  const Result.failure(Exception exception)
      : this._(isSuccess: false, exception: exception);

  final Exception? exception;
  final bool isSuccess;
  final Type? value;
}
