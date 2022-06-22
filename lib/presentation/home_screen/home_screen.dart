import '../../application/auth/auth_bloc.dart';
import '../../application/home_screen/bloc/dashboard_bloc.dart';
import '../../application/home_screen/home_screen_tab_type.dart';
import '../../injection.dart';
import '../core/core.dart';
import '../../domain/core/app_localizations_x.dart';
import '../core/design_components/esnya_design_utils.dart';
import '../core/design_components/esnya_icons.dart';
import '../core/design_components/esnya_sizes.dart';
import 'calculator/calculator_tab_view.dart';
import 'dashboard/dashboard_tab_view.dart';
import 'profile/profile_tab_view.dart';
import '../routes/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core/widgets/bottom_navigation_tab.dart';

// for nested navigation see this tutorial: https://gorouter.dev/nested-navigation
// einzelne tabs müssen dann AutomaticKeepAliveClientMixin implementieren, damit state erhalten bleibt.
class HomeScreen extends StatefulWidget {
  final int tabIndex;
  HomeScreen({
    required HomeScreenTabType tab,
    Key? key,
  })  : tabIndex = HomeScreenTabType.values.indexWhere((e) => e == tab),
        super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: HomeScreenTabType.values.length,
      vsync: this,
      initialIndex: widget.tabIndex,
    );
    // todo on change tab, make keyboard disappear
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.index = widget.tabIndex;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);

    return BlocProvider<DashboardBloc>(
      create: (contet) => getIt<DashboardBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Unauthenticated) {
            context.go(AppRoutes.signIn.path);
          }
        },
        builder: (context, state) {
          final loc = AppLocalizations.of(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            bottomNavigationBar: Shadow(
              Container(
                color: colorScheme.surface,
                child: TabBar(
                  indicatorWeight:
                      EsnyaSizes.kEsnyaBottomNavigationIndicatorHeight,
                  controller: _controller,
                  tabs: [
                    for (final i in HomeScreenTabType.values.asMap().keys)
                      BottomNavigationTab(
                        title: loc!
                            .homeScreenTabTitle(HomeScreenTabType.values[i]),
                        iconData:
                            EsnyaIcons.tabIcons[HomeScreenTabType.values[i]] ??
                                EsnyaIcons.placeholder,
                        active: _controller.index == i,
                      )
                    // Tab(
                    //   text: loc!.homeScreenTabTitle(tab),
                    //   icon: Icon(Icons.abc),
                    // )
                  ],
                  onTap: (index) {
                    context
                        .go(HomeScreenTabType.values[index].nameAndPath.path);
                  },
                ),
              ),
            ),
            body: TabBarView(
              controller: _controller,
              children: [
                for (final tab in HomeScreenTabType.values)
                  _mapTabToTabView(tab)!
              ],
            ),
          );
        },
      ),
    );
  }

  Widget? _mapTabToTabView(HomeScreenTabType tab) {
    // switch statement does not work here for some reason
    if (tab == HomeScreenTabType.dashboard) {
      return DashboardTabView();
    } else if (tab == HomeScreenTabType.calculator) {
      return CalculatorTabView();
    } else if (tab == HomeScreenTabType.profile) {
      return ProfileTabView();
    }
    return null;
  }
}
