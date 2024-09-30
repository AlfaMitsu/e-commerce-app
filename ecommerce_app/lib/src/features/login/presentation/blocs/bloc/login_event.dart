abstract class AuthEvent {}

class AuthLoginRequested extends AuthEvent {
  final String email, password;
  AuthLoginRequested(this.email, this.password);
}

class AuthSignUpRequested extends AuthEvent {
  final String email, password;
  AuthSignUpRequested(this.email, this.password);
}

class AuthLogoutRequested extends AuthEvent {}
