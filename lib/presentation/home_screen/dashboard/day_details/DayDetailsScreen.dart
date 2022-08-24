import 'package:esnya/application/home_screen/bloc/dashboard_bloc.dart';
import 'package:esnya/domain/user_data/user_diet_preferences_repository.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/design_components/design_components.dart';
import 'package:esnya/presentation/home_screen/dashboard/widgets/dashboard_header/nutrient_target_header_display.dart';
import 'package:esnya/presentation/routes/app_router.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../widgets/dashboard_header.dart';

class DayDetailsScreen extends StatelessWidget {
  final UniqueId bucketId;
  const DayDetailsScreen({Key? key, required this.bucketId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<DashboardBloc, DashboardState>(
    //   builder: (context, dashboardState) {

    final dashboardBloc = getIt<DashboardBloc>();
    final bucket = dashboardBloc.getBucketById(bucketId);

    if (bucket == null) {
      return const Scaffold(
        body: SafeArea(child: Text("bucket with this id not avalibale.")),
      );
    }

    final colorScheme = getColorScheme(context);

    final dietRepo = getIt<UserDietPreferencesRepository>();
    final langRepo = getIt<LanguageRepository>();

    final bucketDateTime = bucketIdToDate(bucket.id.value);
    final dateTitle = bucket.id != null
        ? langRepo.translateDate(
            bucketDateTime,
            includeYear: true,
            replaceDateByTodayRelation: false,
            dateTodayRelation: computeDateTodayRelation(bucketDateTime),
          )
        : "Unknown Date";

    return BlocProvider<DashboardBloc>(
      create: (context) => getIt<DashboardBloc>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
                padding: EsnyaSizes.paddingBase2,
                color: colorScheme.surface,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        EsynaButton.surface(
                          title: "back to dashboard",
                          leadingIcon: EsnyaIcons.back,
                          onPressed: () {
                            context.go(AppRoutes.homeDashboard.path);
                          },
                          buttonSize: ButtonSize.medium,
                        ),
                      ],
                    ),
                    EsnyaSizes.spaceBaseHeight2,
                    EsnyaSizes.spaceBaseHeight2,
                    DashboardHeaderContents(
                      bucket: bucket,
                    ),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                    Text("hashsahas"),
                  ],
                )),
          ),
        ),
      ),
    );
    //   },
    // );
  }
}
