extension JsonMap on Map<String, dynamic> {
  T get<T>(String key) {
    if (this[key] is T) {
      return this[key] as T;
    }
    throw FormatException('Key $key not found in $this');
  }

  T? getOrNull<T>(String key) {
    if (this[key] is T) {
      return this[key] as T;
    }
    return null;
  }
}
