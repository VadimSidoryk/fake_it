class MissingProviderException implements Exception {
  final Type type;

  MissingProviderException(this.type);

  @override
  String toString() {
    return "Missing Provider for type: $type";
  }
}

