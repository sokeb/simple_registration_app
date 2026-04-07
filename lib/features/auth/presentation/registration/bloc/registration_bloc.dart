import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_registration_app/features/auth/domain/models/user_model.dart';
import 'package:simple_registration_app/features/auth/domain/repository/auth_repo.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc({required AuthRepo authRepo})
    : _authRepo = authRepo,
      super(const RegistrationState()) {
    on<OnRegistration>(_onContinuePressed);
  }

  final AuthRepo _authRepo;

  Future<void> _onContinuePressed(
    OnRegistration event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(state.copyWith(status: .loading, statusMsg: ''));

    try {
      final errorMsg = await _authRepo.registration(user: event.user);
      if (errorMsg == null) {
        emit(
          state.copyWith(
            status: .success,
            statusMsg: 'Registration Successful',
          ),
        );
      } else {
        emit(state.copyWith(status: .failure, statusMsg: errorMsg));
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: .failure,
          statusMsg: e.toString(),
        ),
      );
    }
  }
}
