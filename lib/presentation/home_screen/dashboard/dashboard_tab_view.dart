import 'dart:math';

import 'package:esnya/application/food_data/input/food_input_bloc.dart';
import 'package:esnya/application/user_data/entries/bloc/food_entries_watcher_bloc.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/core.dart';
import 'package:esnya/presentation/core/widgets/food_input_bar.dart';
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
        return BlocBuilder<FoodEntriesWatcherBloc, FoodEntriesWatcherState>(
            builder: (context, foodEntriesWatcherState) {
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
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Text(
            "welcome to app",
            style: TextStyle(fontSize: 50),
          )),
    );
  }

  List<Widget> _buildListElements(BuildContext context) {
    final foodInputState = context.read<FoodInputBloc>().state;
    final foodEntriesState = context.read<FoodEntriesWatcherBloc>().state;

    return [
      if (foodEntriesState is FoodEntriesWatcherStateLoadSuccess)
        ...foodEntriesState.buckets
            .map((b) => Column(children: [
                  Text('Bucket value: ${b.id.value}'),
                  ...b.entries
                      .map((e) => FoodItemEntryDisplayTile(entry: e))
                      .iter
                ]))
            .asList(),
      ...foodInputState.entries.map(
        (e) => FoodItemEntryDisplayTile(entry: e),
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
