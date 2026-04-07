import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_registration_app/features/auth/domain/repository/auth_repo.dart';
import 'package:simple_registration_app/features/auth/presentation/registration/registration.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(authRepo: context.read<AuthRepo>()),
      child: BlocListener<RegistrationBloc, RegistrationState>(
        listenWhen: (previous, current) =>
            previous.statusMsg != current.statusMsg &&
            current.statusMsg.isNotEmpty,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.statusMsg),
              backgroundColor: state.status == .success
                  ? Colors.green
                  : Colors.red,
            ),
          );
        },

        child: const RegistrationView(),
      ),
    );
  }
}
