part of 'registration_bloc.dart';

enum RegistrationStatus { initial, loading, success, failure }

final class RegistrationState extends Equatable {
  const RegistrationState({
    this.status = RegistrationStatus.initial,
    this.statusMsg = '',
  });

  final RegistrationStatus status;
  final String statusMsg;

  RegistrationState copyWith({
    RegistrationStatus? status,

    String? statusMsg,
  }) {
    return RegistrationState(
      status: status ?? this.status,

      statusMsg: statusMsg ?? this.statusMsg,
    );
  }

  @override
  List<Object> get props => [status, statusMsg];
}
