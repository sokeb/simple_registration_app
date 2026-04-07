import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(const RegistrationState()) {
    on<OnRegistration>(_onContinuePressed);
  }

  Future<void> _onContinuePressed(
      OnRegistration event,
      Emitter<RegistrationState> emit,
      ) async {
    emit(
      state.copyWith(
        status: .loading,
        statusMsg: '',
      ),
    );
    print(['name ==> ${event.name}', 'email ==> ${event.email}', 'password ==> ${event.password}']);
  }
}
