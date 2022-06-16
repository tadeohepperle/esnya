import 'package:esnya/presentation/core/design_components/esnya_design_utils.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya_shared_resources/core/models/models.dart';
import 'package:flutter/material.dart';

class FoodItemEntryDialog extends StatelessWidget {
  final FoodItemEntry foodItemEntry;
  final VoidCallback onDeleteButtonTap;
  const FoodItemEntryDialog({
    Key? key,
    required this.foodItemEntry,
    required this.onDeleteButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    return Container(
      padding: EdgeInsets.all(EsnyaSizes.base),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(EsnyaSizes.base * 2),
      ),
      child: Text(foodItemEntry.input),
    );
  }
}
