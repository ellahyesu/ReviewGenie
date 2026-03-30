class AppException implements Exception {
  const AppException(this.message, {this.details});

  final String message;
  final String? details;

  @override
  String toString() => details == null ? message : '$message ($details)';
}
