// Ignore for testing purposes
// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_registration_app/app/app.dart';
import 'package:simple_registration_app/features/auth/presentation/registration/registration.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(App());
      expect(find.byType(RegistrationView), findsOneWidget);
    });
  });
}
