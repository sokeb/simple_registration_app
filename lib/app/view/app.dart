import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_registration_app/features/auth/domain/repository/auth_repo.dart';
import 'package:simple_registration_app/features/auth/presentation/registration/registration.dart';
import 'package:simple_registration_app/features/auth/service/api_client.dart';
import 'package:simple_registration_app/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthRepo(apiClient: apiClient)),
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          useMaterial3: true,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const RegistrationPage(),
      ),
    );
  }
}
