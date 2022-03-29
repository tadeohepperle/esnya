import 'package:esnya_shared_resources/esnya_shared_resources.dart';

import 'entities/isolate_request.dart';

abstract class IsolateOperation {}

abstract class Isolate2Repository implements SetupRepository, IsolateOperation {
  Future<R> makeRequest<R>(IsolateRequest isolateOperationObject);
}




/*


GetIt<Isolate2Repository>().getRepository<FoodMappingRepository>().hsdhsahsdhadsahdhsa


*/
