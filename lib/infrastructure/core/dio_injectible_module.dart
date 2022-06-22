import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../constants.dart';
import '../../injection_environments.dart';

@isolate2
@module
abstract class DioInjectibleModule {
  @lazySingleton
  Dio get dio => Dio(BaseOptions(
        contentType: "application/json",
        connectTimeout: connectionTimeoutMs,
        receiveTimeout: connectionTimeoutMs,
      ));
}
