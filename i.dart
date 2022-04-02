import 'dart:async';

void main() async {
  StreamController<int> sc = StreamController<int>.broadcast();
  sc.onListen = () {
    print("onlisten");
    sc.add(42);
  };
  await Future.delayed(Duration(seconds: 1));
  final sub = sc.stream.listen((event) {
    print("got : $event");
  });

  for (var i = 0; i < 10; i++) {
    await Future.delayed(Duration(microseconds: 500000));
    sc.add(i);
  }
}
