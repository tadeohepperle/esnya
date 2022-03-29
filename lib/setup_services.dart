import 'package:esnya/domain/isolate2/isolate_2_repository.dart';
import 'package:firebase_core/firebase_core.dart';

import 'injection.dart';

Future<void> setupServices() => Future.wait([
      Firebase.initializeApp(),
      getIt<Isolate2Repository>().setup(),
    ]);
