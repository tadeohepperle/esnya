import 'package:esnya/injection_environments.dart';
import 'package:esnya/setup_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'firebase_options.dart';
import 'injection.dart';
import 'presentation/core/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureInjection(isolate1.name);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupServicesIsolate1();

  runApp(AppWidget());
}
