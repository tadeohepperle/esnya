import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/design_components/esnya_text.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter/material.dart';

class BucketDateTitleListItem extends StatelessWidget {
  final FoodItemEntryBucket bucket;
  const BucketDateTitleListItem({
    Key? key,
    required this.bucket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final langRepo = getIt<LanguageRepository>();

    final bucketDateTime = bucketIdToDate(bucket.id.value);
    final bucketTitle = bucketDateTime != null
        ? langRepo.translateDate(
            bucketDateTime,
            includeYear: true,
            replaceDateByTodayRelation: true,
            dateTodayRelation: computeDateTodayRelation(bucketDateTime),
          )
        : "Unknown Date";

    return Container(
        height: EsnyaSizes.kBucketDateTitleListItemHeight,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            EsnyaText.body(bucketTitle),
            EsnyaText.body("switch")
          ], // TODO: implement switch protein/kcal button instead of text "switch"
        ));
  }
}
