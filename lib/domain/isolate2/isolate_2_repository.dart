import 'package:esnya_shared_resources/esnya_shared_resources.dart';

import 'entities/isolate_request.dart';

abstract class IsolateOperation {}

/// pretty much all heavy data crunching like looking through csv tables with 10000 lines for a matching food or making api calls should happend in the second isolate, this repository instantiates.
/// also some repositories are exculively setup in the second isolate like the FoodMappingRepository containing a list of a bunch of foods.
/// Reading in those values from storage or downloading und updating local files happens all in the second isolate to not slow down the main app.
/// to get the second isolate to do something an [IsolateRequest] can be sent to it with makeRequest() Then an [IsolateResponse] is returned that carries the actual payload that is then returned from makeRequest()
abstract class Isolate2Repository implements SetupRepository, IsolateOperation {
  Future<R> makeRequest<R>(IsolateRequest<R> isolateOperationObject);
}


/*

Notes about working with the Isolate 2 (2022-05-06):

# Instatiation
On App Start in the main() method the second repository is instantiated via  getIt<Isolate2Repository>().setup(). 
This instantiates the isolate 2.
In Isolate 2 we do not use injectible, but will register the couple repositories used there by hand. 

# Communication
All Communication with the isolate 2 is a bit cumbersome and therefore should be limited to really data heavy operations.
It works by sending IsolateRequest<R> Objects via  Isolate2Repository.makeRequest<R> which returns a Future<R>.
Example:
 class IsoRequestGetTime extends IsolateRequest<DateTime>{}

 --> make request, get DateTime back. 






*/
