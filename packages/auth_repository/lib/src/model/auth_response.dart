///
class AuthResponse {
  ///
  AuthResponse({
    required this.status,
    this.message
});
  ///
  final bool status;

  ///
  final String? message;
}