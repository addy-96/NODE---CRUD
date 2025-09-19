class UserAlreadyExistException implements Exception {
  UserAlreadyExistException({required this.message});

  final String message;

  @override
  String toString() => 'UserAlreadyExistException: $message';
}
