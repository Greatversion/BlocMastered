abstract class SignInEvent {}

class SignInTextChangedEvent extends SignInEvent {
  final String emailvalue;
  final String passwordvalue;

  SignInTextChangedEvent(
      {required this.emailvalue, required this.passwordvalue});
}

class SignInSubmittedEvent extends SignInEvent {
  final String email;
  final String password;

  SignInSubmittedEvent({required this.email, required this.password});

}
