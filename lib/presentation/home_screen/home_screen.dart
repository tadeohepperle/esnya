import 'package:esnya/application/auth/auth_bloc.dart';
import 'package:esnya/application/home_screen/home_screen_tab_type.dart';
import 'package:esnya/domain/auth/auth_repository.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/core.dart';
import 'package:esnya/domain/core/app_localizations_x.dart';
import 'package:esnya/presentation/home_screen/calculator/calculator_tab_view.dart';
import 'package:esnya/presentation/home_screen/dashboard/dashboard_tab_view.dart';
import 'package:esnya/presentation/home_screen/profile/profile_tab_view.dart';
import 'package:esnya/presentation/routes/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          context.go(AppRoutes.signIn.path);
        }
      },
      builder: (context, state) {
        final loc = AppLocalizations.of(context);
        final authBloc = context.read<AuthBloc>();
        return Scaffold(
          appBar: AppBar(
            title: Text(kAppName),
            bottom: TabBar(
              controller: _controller,
              tabs: [
                for (final tab in HomeScreenTabType.values)
                  Tab(text: loc!.homeScreenTabTitle(tab))
              ],
              onTap: (index) {
                context.go(HomeScreenTabType.values[index].nameAndPath.path);
              },
            ),
          ),
          body: TabBarView(
            controller: _controller,
            children: [
              for (final tab in HomeScreenTabType.values) _mapTabToTabView(tab)!
            ],
          ),
        );
      },
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
  }
}
