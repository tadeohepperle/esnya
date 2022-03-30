import 'package:esnya/infrastructure/core/api/food_backend_client.dart';
import 'package:esnya/infrastructure/core/api/models/guess_food_request_body.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/core/models/food.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'food_backend_client_impl.g.dart';

/// We can access localhost of our computer like so: http://10.0.2.2:8080/data/food/173818 when we run the esnya_food_backend dart app on port 8080

@isolate2
@RestApi(baseUrl: "http://10.0.2.2:8080/")
@LazySingleton(as: FoodBackendClient)
abstract class FoodBackendClientImpl implements FoodBackendClient {
  @factoryMethod
  factory FoodBackendClientImpl(Dio dio) = _FoodBackendClientImpl;

  @override
  @GET("/data/food/{id}")
  Future<Food> getFood(@Path("id") String id);

  @override
  @POST("/guess/food")
  Future<FoodMappingResult> mapInput(@Body() GuessFoodRequestBody body);
}
