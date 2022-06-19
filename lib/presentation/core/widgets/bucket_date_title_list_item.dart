import 'package:esnya/domain/user_data/user_diet_preferences_repository.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/design_components/esnya_colors.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/design_components/esnya_text.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter/material.dart';

class BucketDateTitleListItem extends StatelessWidget {
  final DayBucket bucket;
  const BucketDateTitleListItem({
    Key? key,
    required this.bucket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final langRepo = getIt<LanguageRepository>();
    final userDietRepo = getIt<UserDietPreferencesRepository>();

    final bucketDateTime = bucketIdToDate(bucket.id.value);
    final bucketTitle = bucketDateTime != null
        ? langRepo.translateDate(
            bucketDateTime,
            includeYear: false,
            replaceDateByTodayRelation: true,
            dateTodayRelation: computeDateTodayRelation(bucketDateTime),
          )
        : "Unknown Date";

    final nutrientAmounts = bucket.computedNutrientAmounts;
    _nutrientTypeName(NutrientType n) {
      return n == NutrientType.energy
          ? ""
          : " " + langRepo.translateNutrientType(n);
    }

    final nutrientPrimary = userDietRepo.preferredNutrientPrimary;
    final nutrientSecondary = userDietRepo.preferredNutrientSecondary;
    final nutrientPrimaryText = nutrientAmounts[nutrientPrimary] != null
        ? langRepo.translateAmount(nutrientAmounts[nutrientPrimary]!) +
            _nutrientTypeName(nutrientPrimary)
        : null;
    final nutrientSecondaryText = nutrientAmounts[nutrientSecondary] != null
        ? langRepo.translateAmount(nutrientAmounts[nutrientSecondary]!) +
            _nutrientTypeName(nutrientSecondary)
        : null;

    // final nutrientText = [
    //   userDietRepo.preferredNutrientPrimary,
    //   userDietRepo.preferredNutrientSecondary
    // ]
    //     .map((n) => nutrientAmounts[n] != null
    //         ? (langRepo.translateAmount(nutrientAmounts[n]!) +
    //             _nutrientTypeName(n))
    //         : "")
    //     .where((e) => e.isNotEmpty)
    //     .join(", ");

    return Container(
        padding: EdgeInsets.symmetric(horizontal: EsnyaSizes.base),
        height: EsnyaSizes.kBucketDateTitleListItemHeight,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            EsnyaText.titleBold(
              bucketTitle,
              color: colorSchemeLight.onSurface,
            ),
            Row(
              children: [
                if (nutrientPrimaryText != null)
                  EsnyaText.titleBold(
                    nutrientPrimaryText,
                    color: colorSchemeLight.onSurface,
                  ),
                if (nutrientPrimaryText != null &&
                    nutrientSecondaryText != null)
                  EsnyaText.titleBold(
                    " | ",
                    color: colorSchemeLight.onSurface,
                  ),
                if (nutrientSecondaryText != null)
                  EsnyaText.titleBold(
                    nutrientSecondaryText,
                    color: colorSchemeLight.onSurface,
                  )
              ],
            )
          ], // TODO: use real numbers
        ));
  }
}
