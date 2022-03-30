// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_backend_client_impl.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _FoodBackendClientImpl implements FoodBackendClientImpl {
  _FoodBackendClientImpl(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://10.0.2.2:8080/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Food> getFood(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Food>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/data/food/${id}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Food.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FoodMappingResult> mapInput(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FoodMappingResult>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/guess/food',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FoodMappingResult.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
