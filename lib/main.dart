import 'package:esnya/setup_services.dart';
import 'package:esnya_shared_resources/core/utils/time_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'injection.dart';
import 'presentation/core/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.dev);
  // await timeTest(() async {
  await Future.wait([
    Firebase.initializeApp(),
    setupServices(),
    // TODO: THINK: is await even appropriate here for setupServices() (spawning isolate 2)?
  ]);

  // }, title: "startup", debug: true);

  runApp(AppWidget());
}
