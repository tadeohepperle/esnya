import 'dart:isolate';

class Isolate2SpawnArguments {
  final SendPort sPort;
  final String dataDirectoryPath;

  Isolate2SpawnArguments({
    required this.sPort,
    required this.dataDirectoryPath,
  });
}
