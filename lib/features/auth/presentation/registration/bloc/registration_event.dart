part of 'registration_bloc.dart';

sealed class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

final class OnRegistration extends RegistrationEvent {
  const OnRegistration({
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;

  @override
  List<Object> get props => [name, email, password];

}


final class RegisterError extends RegistrationEvent {
  const RegisterError(this.message);

  final String message;
}
