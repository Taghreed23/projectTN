import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/c_widget/t_circular_icon.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';

class ProductQuantityaddRemoveButton extends StatefulWidget {
  ProductQuantityaddRemoveButton({super.key, required this.quantity});
  final Map<dynamic, dynamic> quantity;

  @override
  State<ProductQuantityaddRemoveButton> createState() =>
      _ProductQuantityaddRemoveButtonState();
}

class _ProductQuantityaddRemoveButtonState
    extends State<ProductQuantityaddRemoveButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 70,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TCircularIcon(
              icon: Iconsax.minus,
              width: 32,
              height: 32,
              size: TSizes.md,
              color: THelperFunctions.isDarkMode(context)
                  ? TColors.white
                  : TColors.black,
              backgroundColor: THelperFunctions.isDarkMode(context)
                  ? TColors.darkGrey
                  : TColors.light,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              widget.quantity["quantity"].toString(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            const TCircularIcon(
              icon: Iconsax.add,
              width: 32,
              height: 32,
              size: TSizes.md,
              color: TColors.white,
              backgroundColor: TColors.primary,
            ),
          ],
        )
      ],
    );
  }
}
