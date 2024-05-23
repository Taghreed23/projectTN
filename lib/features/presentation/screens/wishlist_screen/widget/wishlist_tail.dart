import 'package:flutter/material.dart';
import 'package:food_saver/data/network/wishlist/add_wishlist_request.dart';
import 'package:food_saver/data/network/wishlist/del_wishlist_request.dart';
import 'package:food_saver/features/presentation/model/offer_model.dart';
import 'package:food_saver/features/presentation/screens/offer_card_screen/views/offer_detalies_screen.dart';
import 'package:food_saver/features/presentation/screens/wishlist_screen.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:food_saver/common/widgets/circular_icons.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:food_saver/data/network/home_request.dart';
import 'package:food_saver/data/network/api.dart';
import 'package:food_saver/features/presentation/screens/wishlist_screen/provider/provider_state.dart';
import 'package:food_saver/data/network/wishlist/wishlist_request.dart';
import 'package:provider/provider.dart';

// cached network image
class WishlistTail extends StatefulWidget {
  WishlistTail(
      {super.key, required this.color, required this.icon, required this.data});
  final Color color;
  final IconData icon;
  final Map<String, dynamic> data;

  @override
  State<WishlistTail> createState() => _HerzontalOfferTileState();
}

class _HerzontalOfferTileState extends State<WishlistTail> {
  WishlistDelRequest _WishlistDel = WishlistDelRequest();
  WishlistRequest _wishlistData = WishlistRequest();
  @override
  Widget build(BuildContext context) {
    print(widget.data);
    final dark = THelperFunctions.isDarkMode(context);
    final myState = Provider.of<MyState>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return OfferDetalies(
                ProductId: widget.data["product_id"].toString(),
              );
            },
          ),
        );
      },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(3, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          children: [
            Container(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                  color: dark ? Colors.white : TColors.light,
                  borderRadius: BorderRadius.circular(TSizes.cardRadiuslg),
                  border: Border.all(color: TColors.borderPrimary)),
              child: Stack(children: [
                // image

                GestureDetector(
                  onTap: () {},
                  child: Container(
                      decoration: BoxDecoration(
                          color: TColors.light,
                          borderRadius: BorderRadius.circular(TSizes.md)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(TSizes.md),
                        child: Image(
                            image: NetworkImage(
                                "${Api.baseUrl2}${widget.data['product_image']}")),
                      )),
                ),

                // time tag
                Positioned(
                  top: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: TColors.secondry.withOpacity(0.8),
                    ),
                    child: Text('',
                        //widget.data["expire_time_humified"],
                        maxLines: 1,
                        style: TextStyle(color: Colors.black, fontSize: 7)),
                  ),
                ),

                // fav
                Positioned(
                  top: 0,
                  right: 0,
                  child: TCircularIcon(
                      onPressed: () {
                        _WishlistDel.delFromwishlist(
                            id: widget.data["product_id"]);
                      },
                      icon: widget.icon,
                      color: widget.color),
                )
              ]),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            // details
            // title

            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                children: [
                  Text(
                    widget.data["product_name"],
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  // resturant name
                  Row(
                    children: [
                      Text(
                        widget.data["product_shop_name"],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      SizedBox(
                        width: TSizes.xs,
                      ),
                      Icon(
                        Iconsax.verify5,
                        color: TColors.primary,
                        size: TSizes.iconxs,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // price
                      Text(
                        '${widget.data["product_price"].toString()} E£',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: TColors.primary,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(TSizes.cardRadiuslg),
                                bottomRight:
                                    Radius.circular(TSizes.productImageRadius),
                              )),
                          child: const SizedBox(
                            width: TSizes.iconlg * 1.2,
                            height: TSizes.iconlg * 1.2,
                            child: Center(
                              child: Icon(
                                Iconsax.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
