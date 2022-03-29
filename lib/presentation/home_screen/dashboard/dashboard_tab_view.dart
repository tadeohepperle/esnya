import 'package:esnya/domain/isolate2/entities/isolate_request.dart';
import 'package:esnya/domain/isolate2/isolate_2_repository.dart';
import 'package:esnya/injection.dart';
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
              final isolateRepo = getIt<Isolate2Repository>();
              print(
                  'makeRequest(IsolateRequest.helloWorld("Tadeo sagt hallo"))');
              // final res = await isolateRepo
              //     .makeRequest(IsolateRequest.helloWorld("Tadeo sagt hallo"));

              final res = await isolateRepo.makeRequest(
                  IsolateRequest.foodDataRepositoryGetFoodFromID("292"));
              print(res);
            },
            child: Text("press")),
      ],
    );
  }
}
