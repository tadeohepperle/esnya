import 'dart:math';

import 'package:esnya/application/food_data/input/food_input_bloc.dart';
import 'package:esnya/application/home_screen/bloc/dashboard_bloc.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/core.dart';
import 'package:esnya/presentation/core/widgets/food_input_bar.dart';
import 'package:esnya/presentation/core/widgets/food_item_entry_list_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodInputBloc>(
      create: (context) => getIt<FoodInputBloc>(),
      child: BlocBuilder<FoodInputBloc, FoodInputState>(
          builder: (context, foodInputState) {
        return BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, dashboardState) {
          return SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(context),
                  ...List.generate(50, (index) => Text(index.toRadixString(3)))
                ]),
          );
        });
      }),
    );
  }

  Widget _buildHeader(context) {
    return Container(
      height: 80,
      color: Colors.amber,
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            "welcome to app",
            style: TextStyle(fontSize: 10),
          )),
    );
  }

  Widget _buildFoodInputBar(BuildContext context) {
    return FoodInputBar(
      onChanged: (v) {
        // context.read<FoodInputBloc>().add(FoodInputEvent.setVolatileText(v));
      },
      onSubmitted: (v) {
        // context
        //     .read<FoodInputBloc>()
        //     .add(const FoodInputEvent.saveVolatileText());
      },
      onClosed: (v) {
        // context
        //     .read<FoodInputBloc>()
        //     .add(const FoodInputEvent.saveVolatileText());
        // FocusManager.instance.primaryFocus?.unfocus();
        // if (_dashboardInputState == DashboardInputState.text) {
        //   setState(() {
        //     _dashboardInputState = DashboardInputState.closed;
        //   });
        // }
      },
    );
  }
}

enum DashboardInputState { closed, text, voice }
