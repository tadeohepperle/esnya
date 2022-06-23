import 'dart:async';

import 'package:esnya/presentation/core/widgets/food_input/food_input_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../../application/food_data/input/food_input_bloc.dart';
import '../../../application/home_screen/bloc/dashboard_bloc.dart';
import '../../../injection.dart';
import '../../core/core.dart';
import 'widgets/dashboard_entries_list.dart';
import 'widgets/dashboard_header.dart';

const kFoodInputWidgetContextId = "dashboard";

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
    super.build(context);
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, dashboardState) {},
      builder: (context, dashboardState) {
        final listViewHeight =
            _determineAvailableRenderHeightForListView(context);
        return Stack(
          children: [
            // the body of the page (header + list of entries)
            Column(
              children: [
                DashboardHeader(),
                SizedBox(
                  height: listViewHeight,
                  width: double.infinity,
                  child: DashboardEntriesList(
                      availableRenderHeight: listViewHeight),
                ),
              ],
            ),
            // the bottom floating action icons / the voice input panel + text input bar clinging to the keyboard
            FoodInputWidget(
              contextId: kFoodInputWidgetContextId,
            ),
          ],
        );
      },
    );
  }

  double _determineAvailableRenderHeightForListView(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.height -
        mediaQuery.padding.top -
        EsnyaSizes.kDashboardHeaderheightWithoutUnsafeArea -
        EsnyaSizes.kEsnyaBottomNavigationBarHeight;
  }
}


  /// Layout for this page:
  /// xpx unsafeArea
  /// 172px header (EsnyaSizes.kDashboardHeaderheightWithoutUnsafeArea)
  ///
  ///
  ///
  /// 48px tabnavigation (EsnyaSizes.kEsnyaBottomNavigationTabHeight)
