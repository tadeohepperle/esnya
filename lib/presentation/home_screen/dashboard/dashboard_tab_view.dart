import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/core.dart';
import 'package:esnya_shared_resources/food_data/repositories/food_data_repository.dart';
import 'package:esnya_shared_resources/food_mapping/repositories/food_mapping_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashboardTabView extends StatefulWidget {
  const DashboardTabView({Key? key}) : super(key: key);

  @override
  State<DashboardTabView> createState() => _DashboardTabViewState();
}

class _DashboardTabViewState extends State<DashboardTabView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  var foodId = "";
  var foodResult = "";

  var foodName = "";
  var foodMappingResult = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsX.allMedium,
      child: ListView(
        children: [
          Text(
            "Dashboard - Home",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
          SizedBoxX.hMedium,
          Text("input food id, for example 167616 for salmon"),
          TextField(
            onChanged: (value) {
              setState(() {
                foodId = value;
              });
            },
          ),
          ElevatedButton(
              onPressed: () async {
                await timeTest(() async {
                  setState(() {
                    foodResult = "loading...";
                  });
                  final res =
                      await getIt<FoodDataRepository>().getFoodFromID(foodId);
                  print(res);
                  setState(() {
                    foodResult = res.toString();
                  });
                },
                    debug: true,
                    title: 'FoodDataRepository.getFoodFromID("$foodId")');
              },
              child: Text("FoodDataRepository request")),
          Text("Result:"),
          Text(foodResult),
          Divider(
            height: 20,
          ),
          Text("input any food name a user could input:"),
          TextField(
            onChanged: (value) {
              setState(() {
                foodName = value;
              });
            },
          ),
          ElevatedButton(
              onPressed: () async {
                await timeTest(() async {
                  setState(() {
                    foodMappingResult = "loading...";
                  });
                  final res =
                      await getIt<FoodMappingRepository>().mapInput(foodName);
                  print(res);
                  setState(() {
                    foodMappingResult = res.toString();
                  });
                },
                    debug: true,
                    title: 'FoodMappingRepository.mapInput("$foodName")');
              },
              child: Text("FoodMappingRepository request")),
          Text("Result:"),
          Text(foodMappingResult),
        ],
      ),
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
