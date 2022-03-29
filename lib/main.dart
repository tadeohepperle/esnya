import 'package:esnya/setup_services.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'injection.dart';
import 'presentation/core/app_widget.dart';

void main() async {
  configureInjection(Environment.dev);
  await setupServices(); // TODO: THINK: is await appropriate here?
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppWidget());
}
