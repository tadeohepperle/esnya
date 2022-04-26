import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esnya/application/food_data/input/food_input_bloc.dart';
import 'package:esnya/application/home_screen/bloc/dashboard_bloc.dart';
import 'package:esnya/domain/auth/auth_repository.dart';
import 'package:esnya/domain/core/errors.dart';
import 'package:esnya/infrastructure/core/firestore_helpers.dart';
import 'package:esnya/infrastructure/user_data/dtos/food_item_entry_bucket_dto.dart';
import 'package:esnya/infrastructure/user_data/food_item_entry_bucket_repository_impl_firebase.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/core.dart';
import 'package:esnya/presentation/core/widgets/food_input_bar.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';

import '../../core/widgets/food_item_entry_display_tile.dart';

class DashboardTabView extends StatefulWidget {
  const DashboardTabView({Key? key}) : super(key: key);

  @override
  State<DashboardTabView> createState() => _DashboardTabViewState();
}

class _DashboardTabViewState extends State<DashboardTabView>
    with AutomaticKeepAliveClientMixin {
  late DashboardInputState _dashboardInputState;
  late ScrollController _scrollController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _dashboardInputState = DashboardInputState.closed;
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  static const kHeaderHeight = 150;
  static const kBottomPaddingHeight = 150.0;
  // static const

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodInputBloc>(
      create: (context) => getIt<FoodInputBloc>(),
      child: BlocBuilder<FoodInputBloc, FoodInputState>(
          builder: (context, foodInputState) {
        return BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, dashboardState) {
          double bottomPadding = max(
              MediaQuery.of(context).viewInsets.bottom, kBottomPaddingHeight);
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(context),
                  Expanded(
                    child: SingleChildScrollView(
                      reverse: true,
                      child: Column(children: [
                        ..._buildListElements(context),
                      ]),
                    ),
                  ),
                  if (_dashboardInputState == DashboardInputState.text)
                    _buildFoodInputBar(context),
                  Container(
                    height: bottomPadding,
                  ),
                ],
              ),
              Column(
                children: [
                  Expanded(child: SizedBox.shrink()),
                  if (_dashboardInputState == DashboardInputState.closed)
                    _buildBottomMenu(context)
                ],
              )
            ],
          );
        });
      }),
    );
  }

  Widget _buildHeader(context) {
    return Container(
      color: Colors.amber,
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            "welcome to app",
            style: TextStyle(fontSize: 10),
          )),
    );
  }

  List<Widget> _buildListElements(BuildContext context) {
    final foodInputState = context.read<FoodInputBloc>().state;
    final dashboardState = context.read<DashboardBloc>().state;

    return [
      ...dashboardState.buckets.reversed().iter.map((b) => Column(children: [
            Text('Bucket value: ${b.id.value}'),
            ...b.entries.iter.map((e) => FoodItemEntryDisplayTile(
                  entry: e,
                  bucketId: b.id,
                ))
          ])),
      Divider(
        height: 10,
        color: Colors.black,
      ),
      ...dashboardState.entriesBetweenBlocAndRepo.iter.map(
        (e) => FoodItemEntryDisplayTile(
          entry: e,
          color: Colors.blue,
        ),
      ),
      ...dashboardState.entriesFoodInputBloc.iter.map(
        (e) => FoodItemEntryDisplayTile(
          entry: e,
          color: Colors.orange,
        ),
      )
    ];
  }

  void _scrollDownInEntryList() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  Widget _buildFoodInputBar(BuildContext context) {
    return FoodInputBar(
      onChanged: (v) {
        context.read<FoodInputBloc>().add(FoodInputEvent.setVolatileText(v));
      },
      onSubmitted: (v) {
        context
            .read<FoodInputBloc>()
            .add(const FoodInputEvent.saveVolatileText());
      },
      onClosed: (v) {
        _closeTextInput(context);
      },
    );
  }

  _openTextInput(BuildContext context) {
    if (_dashboardInputState == DashboardInputState.closed) {
      context.read<FoodInputBloc>().add(FoodInputEvent.setVolatileText(''));
      setState(() {
        _dashboardInputState = DashboardInputState.text;
      });
    }
  }

  _closeTextInput(BuildContext context) {
    context.read<FoodInputBloc>().add(const FoodInputEvent.saveVolatileText());
    FocusManager.instance.primaryFocus?.unfocus();
    if (_dashboardInputState == DashboardInputState.text) {
      setState(() {
        _dashboardInputState = DashboardInputState.closed;
      });
    }
  }

  Widget _buildBottomMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        // button for text input to open
        child: FloatingActionButton(
          onPressed: () {
            _openTextInput(context);
          },
          child: Icon(Icons.food_bank),
        ),
      ),
    );
  }
}

enum DashboardInputState { closed, text }

// void _postRandomDataToFireStore() async {
//   FirebaseFirestore _firestore = getIt<FirebaseFirestore>();
//   AuthRepository _authRepo = getIt<AuthRepository>();
//   var user = _authRepo
//       .getSignedInUser()
//       .getOrElse(() => throw NotAuthenticatedError());
//   final userDoc = await _firestore.userDocument();
//   var startDate = DateTime(2021, 1, 1);

//   for (var i = 0; i < 200; i++) {
//     startDate = startDate.add(Duration(days: 1));
//     var y = startDate.year.toString();
//     var m = startDate.month.toString().padLeft(2, '0');
//     var d = startDate.day.toString().padLeft(2, '0');
//     var bucketid = 'log-$y-$m-$d';

//     int nEntries = randInt(0, 8);
//     DateTime entryTime = startDate.add(Duration(hours: randInt(0, 12)));
//     List<FoodItemEntry> entries = [];
//     for (var i = 0; i < nEntries; i++) {
//       entryTime = entryTime.add(Duration(minutes: randInt(0, 59)));
//       entries.add(TestObjectFaker.randomFoodItemEntry(entryTime));
//     }

//     var bucket = FoodItemEntryBucket(
//         userId: user.id,
//         id: UniqueId.fromUniqueString(bucketid),
//         type: FoodItemEntryBucketType.log,
//         entries: entries.toImmutableList());

//     await userDoc.collection("buckets").doc(bucketid).set(bucket.toFireStore());
//     print("sent bucket for $startDate");
//     print("----------");
//   }
// }
