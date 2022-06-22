import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';

import 'firebase_options.dart';
import 'injection.dart';
import 'injection_environments.dart';
import 'presentation/core/app_widget.dart';
import 'setup_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Loggy.initLoggy();
  configureInjection(isolate1.name);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupServicesIsolate1();

  runApp(AppWidget());
}
