part of 'registration_bloc.dart';

sealed class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

final class OnRegistration extends RegistrationEvent {
  const OnRegistration({
    required this.user,
  });

  final UserModel user;

  @override
  List<Object> get props => [user];
}

final class RegisterError extends RegistrationEvent {
  const RegisterError(this.message);

  final String message;
}
