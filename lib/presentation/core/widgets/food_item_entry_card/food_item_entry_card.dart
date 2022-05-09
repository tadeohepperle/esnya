import 'package:esnya/presentation/core/core.dart';
import 'package:esnya/presentation/core/widgets/food_item_entry_card/food_item_entry_success_card.dart';
import 'package:esnya_shared_resources/core/core.dart';

import 'food_item_entry_semantic_success_card.dart';

class FoodItemEntryCard extends StatelessWidget {
  final FoodItemEntry foodItemEntry;
  final VoidCallback? onDeleteButtonClick;
  final VoidCallback? onCloseButtonClick;
  final VoidCallback? onTimeButtonClick;
  final VoidCallback? onAmountButtonClick;
  const FoodItemEntryCard({
    Key? key,
    required this.foodItemEntry,
    this.onDeleteButtonClick,
    this.onTimeButtonClick,
    this.onAmountButtonClick,
    this.onCloseButtonClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return foodItemEntry.map(
      semanticSuccess: (semanticSuccess) => FoodItemEntrySemanticSuccessCard(
        foodItemEntry: semanticSuccess,
        onDeleteButtonClick: onDeleteButtonClick,
        onTimeButtonClick: onTimeButtonClick,
        onAmountButtonClick: onAmountButtonClick,
        onCloseButtonClick: onCloseButtonClick,
      ),
      success: (success) => FoodItemEntrySuccessCard(
        foodItemEntry: success,
        onDeleteButtonClick: onDeleteButtonClick,
        onTimeButtonClick: onTimeButtonClick,
        onAmountButtonClick: onAmountButtonClick,
        onCloseButtonClick: onCloseButtonClick,
      ),
    );
  }
}
