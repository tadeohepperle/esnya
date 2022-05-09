import 'package:dio/dio.dart';
import 'package:esnya/injection_environments.dart';
import 'package:injectable/injectable.dart';

import '../../constants.dart';

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
