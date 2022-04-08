import 'package:bloc/bloc.dart';
import 'package:esnya/application/home_screen/home_screen_tab_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_tabs_event.dart';
part 'home_screen_tabs_state.dart';
part 'home_screen_tabs_bloc.freezed.dart';

class HomeScreenTabsBloc
    extends Bloc<HomeScreenTabsEvent, HomeScreenTabsState> {
  HomeScreenTabsBloc() : super(HomeScreenTabsState.initial()) {
    on<HomeScreenTabsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
