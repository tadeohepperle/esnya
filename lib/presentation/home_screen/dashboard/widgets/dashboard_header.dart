import 'package:esnya/presentation/core/core.dart';
import 'package:esnya/presentation/routes/app_router.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:go_router/go_router.dart';
import 'package:kt_dart/collection.dart';

import '../../../../application/home_screen/bloc/dashboard_bloc.dart';
import '../../../../domain/auth/auth_repository.dart';
import '../../../../domain/user_data/user_diet_preferences_repository.dart';
import '../../../../infrastructure/user_data/utils/food_item_entry_bucket_utils.dart';
import '../../../../injection.dart';
import 'dashboard_header/nutrient_target_header_display.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final authRepo = getIt<AuthRepository>();
    final userId = authRepo.getSignedInUser().toNullable()!.id;

    // TODO: make it better when bucket null
    var headerBucket = getIt<DashboardBloc>().state.headerBucket;
    final bucket = headerBucket ??
        DayBucket(
            userId: userId,
            id: bucketIdForToday(),
            entries: <FoodItemEntry>[].toImmutableList());

    return Shadow(
      MaterialButton(
        onPressed: () {
          // TODO

          context.go(AppRoutes.homeDashboard.path + "/" + bucket.id.value);
        },
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.all(0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          side: BorderSide.none,
        ),
        color: colorScheme.surface,
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        child: SafeArea(
          child: Container(
              padding: const EdgeInsets.all(EsnyaSizes.base * 2),
              width: double.infinity,
              height: EsnyaSizes.kDashboardHeaderheightWithoutUnsafeArea,
              child: DashboardHeaderContents(
                bucket: bucket,
              )),
        ),
      ),
    );
  }
}

class DashboardHeaderContents extends StatelessWidget {
  final DayBucket bucket;
  const DashboardHeaderContents({Key? key, required this.bucket})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final dietRepo = getIt<UserDietPreferencesRepository>();
    final langRepo = getIt<LanguageRepository>();

    final authRepo = getIt<AuthRepository>();

    final nutrientAmounts = bucket.computedNutrientAmounts;

    final bucketDateTime = bucketIdToDate(bucket.id.value);
    final dateTitle = bucketDateTime != null
        ? langRepo.translateDate(
            bucketDateTime,
            includeYear: true,
            replaceDateByTodayRelation: false,
            dateTodayRelation: computeDateTodayRelation(bucketDateTime),
          )
        : "Unknown Date";

    final primaryNutrient = dietRepo.preferredNutrientPrimary;
    final secondaryNutrient = dietRepo.preferredNutrientSecondary;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Hero(
          tag: "DashboardHeaderContentsDate",
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 8.0),
                child: Icon(
                  EsnyaIcons.calendar,
                  size: 18,
                  color: colorScheme.onBackground,
                ),
              ),
              EsnyaText.title(
                dateTitle,
                color: colorScheme.onBackground,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Hero(
          tag: "DashboardHeaderContentsPrimaryNutrient",
          child: NutrientTargetHeaderDisplay(
            nutrientTarget: dietRepo.getDailyTarget(primaryNutrient),
            consumedAmount: nutrientAmounts[primaryNutrient],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Hero(
          tag: "DashboardHeaderContentsSecondaryNutrient",
          child: NutrientTargetHeaderDisplay(
            nutrientTarget: dietRepo.getDailyTarget(secondaryNutrient),
            consumedAmount: nutrientAmounts[secondaryNutrient],
          ),
        ),
      ],
    );
  }
}


/////////////////////
/// Sizing:
/// 
/// unsafeare
/// 16px
/// 24px button
/// 8px
/// 40px h1
/// 4px 
/// 8px bar
/// 8px
/// 40px h1
/// 4px
/// 8px bar
/// 16px
