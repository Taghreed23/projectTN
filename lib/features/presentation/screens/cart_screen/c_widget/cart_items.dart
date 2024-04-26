import 'package:flutter/material.dart';
import 'package:food_saver/common/widgets/images/t_rounded_image.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/c_widget/product_text_title.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/c_widget/t_brand_text_with_icon.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/constants/image_strings.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundImage(
          imageUrl: 'assets/categories/Bakery.jpg',
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(title: 'Dessert'),
              const Flexible(
                child: TProductTitleText(
                  title: 'CheeseCake with ',
                  maxLines: 1,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: ' Name:',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: ' shop',
                        style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(
                        text: ' time left:',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: ' 2 days',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
