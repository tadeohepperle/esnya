import 'package:esnya/application/food_data/input/food_input_bloc.dart';
import 'package:esnya/application/user_data/entries/bloc/food_entries_watcher_bloc.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/core.dart';
import 'package:esnya/presentation/core/widgets/food_input_bar.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:esnya_shared_resources/core/models/user_data/user_data.dart';
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
  @override
  bool get wantKeepAlive => true;
  late DashboardInputState dashboardInputState;

  @override
  void initState() {
    super.initState();
    dashboardInputState = DashboardInputState.closed;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodInputBloc>(
      create: (context) => getIt<FoodInputBloc>(),
      child: BlocBuilder<FoodInputBloc, FoodInputState>(
          builder: (context, foodInputState) {
        return BlocBuilder<FoodEntriesWatcherBloc, FoodEntriesWatcherState>(
            builder: (context, foodEntriesWatcherState) {
          // var els = foodEntriesState.entries.map((e) => Text(e.title));
          return _buildInputFrame(
            context: context,
            child: _buildPageContent(
              context: context,
              foodInputState: foodInputState,
              foodEntriesWatcherState: foodEntriesWatcherState,
            ),
          );
        });
      }),
    );
  }

  Widget _buildPageContent({
    required BuildContext context,
    required FoodInputState foodInputState,
    required FoodEntriesWatcherState foodEntriesWatcherState,
  }) {
    return ListView(
      children: [
        Text("safeText: ${foodInputState.safeText}"),
        Text("volatile: ${foodInputState.volatileText}"),
        Divider(
          height: 30,
        ),
        Text("repo entries: "),
        if (foodEntriesWatcherState is FoodEntriesWatcherStateLoadFailure)
          Text("Loadfailure")
        else if (foodEntriesWatcherState
            is FoodEntriesWatcherStateLoadInProgress)
          CircularProgressIndicator()
        else if (foodEntriesWatcherState is FoodEntriesWatcherStateLoadSuccess)
          ...foodEntriesWatcherState.foodItemEntries
              .map((e) => FoodItemEntryDisplayTile(
                    entry: e,
                  ))
              .asList(),
        Text("food input bloc entries: "),
        ...foodInputState.entries.map((e) => FoodItemEntryDisplayTile(
              entry: e,
            )),
      ],
    );
  }

  Widget _buildInputFrame(
      {required BuildContext context, required Widget child}) {
    final bottomWidget = dashboardInputState == DashboardInputState.closed
        ? _buildBottomMenu(context)
        : _buildFoodInputBar(context);

    return Stack(
      children: [
        child,
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            dashboardInputState == DashboardInputState.closed
                ? Expanded(child: SizedBox.shrink())
                : Expanded(
                    // while GestureDetector is shown we cannot click anything on the screen back.
                    child: GestureDetector(
                        onTap: () {
                          _closeTextInput(context);
                        },
                        child: Container(color: Colors.transparent))),
            bottomWidget
          ],
        )
      ],
    );
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
    if (dashboardInputState == DashboardInputState.closed) {
      context.read<FoodInputBloc>().add(FoodInputEvent.setVolatileText(''));
      setState(() {
        dashboardInputState = DashboardInputState.text;
      });
    }
  }

  _closeTextInput(BuildContext context) {
    context.read<FoodInputBloc>().add(const FoodInputEvent.saveVolatileText());
    FocusManager.instance.primaryFocus?.unfocus();
    if (dashboardInputState == DashboardInputState.text) {
      setState(() {
        dashboardInputState = DashboardInputState.closed;
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

  @override
  void dispose() {
    super.dispose();
  }
}

enum DashboardInputState { closed, text }
