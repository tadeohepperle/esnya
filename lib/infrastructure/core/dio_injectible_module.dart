import 'package:dio/dio.dart';
import 'package:esnya/injection_environments.dart';
import 'package:injectable/injectable.dart';

@isolate2
@module
abstract class DioInjectibleModule {
  @lazySingleton
  Dio get dio => Dio(BaseOptions(
        contentType: "application/json",
        connectTimeout: 5000,
        receiveTimeout: 3000,
      ));
}
