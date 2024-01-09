// import 'package:firebase_messaging/firebase_messaging.dart';

import 'common/models/localization_config.dart';
import 'feature/app/presentation/pages/app.dart';
import 'initialization.dart';

@pragma('vm:entry-point')

Future<void> main() async {

  await initialization(
    () => const App(),
    localizationConfig: LocalizationConfig(),
  );
}