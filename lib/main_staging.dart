import 'package:simple_registration_app/app/app.dart';
import 'package:simple_registration_app/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
