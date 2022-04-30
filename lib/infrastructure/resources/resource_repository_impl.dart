import 'package:esnya/domain/resources/esnya_resources.dart';
import 'package:esnya/domain/resources/resource_repository.dart';
import 'package:esnya/injection_environments.dart';
import 'package:injectable/injectable.dart';

@isolate1 // TODO: is this correct isolate?
@LazySingleton(as: ResourceRepository)
class ResourceRepositoryImpl implements ResourceRepository {
  final EsnyaResources _resources = EsnyaResources();
  @override
  T getResource<T extends EsnyaResource>() {
    for (var r in _resources.resources) {
      if (r is T) return r;
    }
    throw Exception("Type $T not in EsnyaResources.resources");
  }
}
