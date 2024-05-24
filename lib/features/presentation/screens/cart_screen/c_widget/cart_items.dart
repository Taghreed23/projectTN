// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:food_saver/common/widgets/images/t_rounded_image.dart';
import 'package:food_saver/data/network/api.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/c_widget/product_text_title.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/c_widget/t_brand_text_with_icon.dart';
import 'package:food_saver/features/presentation/screens/offer_card_screen/views/offer_detalies_screen.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/constants/image_strings.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Map<dynamic, dynamic> data;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundImage(
          onPressed: () {
            OfferDetalies(ProductId: widget.data["id"]);
          },
          imageUrl: "${Api.baseUrl2}${widget.data['product_image']}",
          width: 80,
          height: 80,
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
              TBrandTitleWithVerifiedIcon(
                  title: widget.data["product_shop_name"]!),
              Flexible(
                child: TProductTitleText(
                  title: widget.data["product_name"],
                  maxLines: 1,
                ),
              ),
              Row(
                children: [
                  Text(' Address:',
                      style: Theme.of(context).textTheme.bodySmall),
                  Text(widget.data["product_shop_address"],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
              Row(
                children: [
                  Text(' time left:',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall),
                  Text(widget.data["product_expire_time_humified"],
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
