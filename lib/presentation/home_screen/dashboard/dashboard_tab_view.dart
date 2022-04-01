import 'package:esnya/application/core/bloc/food_entries_bloc.dart';
import 'package:esnya/application/food_data/input/food_input_bloc.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/core.dart';
import 'package:esnya/presentation/core/widgets/food_input_bar.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:esnya_shared_resources/core/models/user_data/user_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';

class DashboardTabView extends StatefulWidget {
  const DashboardTabView({Key? key}) : super(key: key);

  @override
  State<DashboardTabView> createState() => _DashboardTabViewState();
}

class _DashboardTabViewState extends State<DashboardTabView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();

    focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    final bg = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        new Expanded(
            child: ListView(
          children: [
            ...List.generate(20,
                (index) => (ListTile(title: Text(index.toString() + "title "))))
          ],
        )),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10.0),
          child: Row(children: [
            Expanded(
              child: TextField(
                focusNode: focusNode,
                textInputAction: TextInputAction.newline,
                onChanged: (value) {},
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("check"))
          ]),
        )
      ],
    );

    var foc = false;
    final fg = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ElevatedButton(
            onPressed: () {
              foc = !foc;
              if (foc) {
                focusNode.requestFocus();
              } else {
                focusNode.unfocus();
              }
            },
            child: Text("toggle")),
        Expanded(
            child: Container(
          color: Colors.yellow,
        )),
        Container(
            color: Color.fromARGB(100, 255, 0, 0),
            child: SizedBox(height: 300, width: 300))
      ],
    );

    return BlocProvider<FoodInputBloc>(
      create: (context) => getIt<FoodInputBloc>(),
      child: BlocBuilder<FoodInputBloc, FoodInputState>(
          builder: (context, foodInputState) {
        return BlocBuilder<FoodEntriesBloc, FoodEntriesState>(
            builder: (context, foodEntriesState) {
          var els = foodEntriesState.entries.map((e) => Text(e.title));
          return Stack(
            children: [
              bg,

              //  fg,
            ],
          );
        });
      }),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
}
