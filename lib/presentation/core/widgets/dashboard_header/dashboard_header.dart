import 'package:esnya/domain/auth/auth_repository.dart';
import 'package:esnya/domain/user_data/user_diet_preferences_repository.dart';
import 'package:esnya/infrastructure/user_data/utils/food_item_entry_bucket_utils.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/design_components/esnya_colors.dart';
import 'package:esnya/presentation/core/design_components/esnya_design_utils.dart';
import 'package:esnya/presentation/core/design_components/esnya_icons.dart';
import 'package:esnya/presentation/core/design_components/utils/grid_overlay.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter/material.dart';
import 'package:kt_dart/collection.dart';

import '../../design_components/esnya_button.dart';
import '../../design_components/esnya_icon_button.dart';
import '../../design_components/esnya_sizes.dart';
import 'nutrient_target_header_display.dart';

class DashboardHeader extends StatelessWidget {
  final DayBucket? bucket;
  final VoidCallback onCardTap;
  final VoidCallback onCalendarTap;
  const DashboardHeader({
    Key? key,
    required this.bucket,
    required this.onCardTap,
    required this.onCalendarTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final dietRepo = getIt<UserDietPreferencesRepository>();
    final langRepo = getIt<LanguageRepository>();

    final authRepo = getIt<AuthRepository>();
    final userId = authRepo.getSignedInUser().toNullable()!.id;
    final bucket = this.bucket ??
        DayBucket(
            userId: userId,
            id: UniqueId.fromUniqueString(bucketIdForToday()),
            entries: <FoodItemEntry>[].toImmutableList());
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
    return Shadow(
      MaterialButton(
        onPressed: onCardTap,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.all(0),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    EsynaButton.surface(
                      title: dateTitle,
                      leadingIcon: EsnyaIcons.calendar,
                      onPressed: onCalendarTap,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                NutrientTargetHeaderDisplay(
                  nutrientTarget: dietRepo.getDailyTarget(primaryNutrient),
                  consumedAmount: nutrientAmounts[primaryNutrient],
                ),
                const SizedBox(
                  height: 8,
                ),
                NutrientTargetHeaderDisplay(
                  nutrientTarget: dietRepo.getDailyTarget(secondaryNutrient),
                  consumedAmount: nutrientAmounts[secondaryNutrient],
                ),
              ],
            ),
          ),
        ),
      ),
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
