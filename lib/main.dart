import 'package:esnya/injection_environments.dart';
import 'package:esnya/setup_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'injection.dart';
import 'presentation/core/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(isolate1.name);
  // await timeTest(() async {
  await Future.wait([
    Firebase.initializeApp(),
    setupServices(),
    // TODO: THINK: is await even appropriate here for setupServices() (spawning isolate 2)?
  ]);
  // }, title: "startup", debug: true);

  runApp(AppWidget());
}
