import 'package:esnya/injection.dart';
import 'package:esnya_shared_resources/food_data/repositories/food_data_repository.dart';
import 'package:flutter/material.dart';

class DashboardTabView extends StatefulWidget {
  const DashboardTabView({Key? key}) : super(key: key);

  @override
  State<DashboardTabView> createState() => _DashboardTabViewState();
}

class _DashboardTabViewState extends State<DashboardTabView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          "Dashboard - Home",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30),
        ),
        ElevatedButton(
            onPressed: () async {
              print('make FoodData Repository request');
              await timeTest(() async {
                final res =
                    await getIt<FoodDataRepository>().getFoodFromID("173818");
                print(res);
              },
                  debug: true,
                  title: 'FoodDataRepository.getFoodFromID("173818")');
            },
            child: Text("make FoodData Repository request")),
      ],
    );
  }
}

Future<double> timeTest(Function f,
    {bool debug = false, String title = "timeTest"}) async {
  if (debug) {
    print("---------------------------------");
    print("START WATCH: $title ");
  }
  var s = Stopwatch();
  s.start();
  await f();
  s.stop();
  if (debug) {
    print("STOP WATCH: elapsed time: ${s.elapsedMicroseconds / 1000} ms \n");
  }

  return s.elapsedMicroseconds / 1000;
}
