import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_saver/features/presentation/model/offer_model.dart';
import 'package:food_saver/features/presentation/screens/offer_card_screen/views/offer_detalies_screen.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/features/presentation/screens/home screen/widgets/offer_tile.dart';
import 'package:iconsax/iconsax.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:food_saver/common/widgets/circular_icons.dart';
import 'package:food_saver/data/network/api.dart';
import 'package:food_saver/data/network/wishlist/add_wishlist_request.dart';

class cateoryTail extends StatefulWidget {
  const cateoryTail({super.key, required this.data});
  final Map<dynamic, dynamic> data;

  @override
  State<cateoryTail> createState() => _cateoryTailState();
}

class _cateoryTailState extends State<cateoryTail> {
  WishlistAddRequest _WishlistAdd = WishlistAddRequest();
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return OfferDetalies(
                ProductId: widget.data["id"],
              );
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 11, right: 11),
        child: Container(
          decoration: BoxDecoration(
            color: dark ? Colors.white : TColors.light,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 5, bottom: 0),
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor:
                          dark ? Colors.grey.shade500 : Colors.white,
                      child: CircleAvatar(
                        radius: 42,
                        backgroundImage: NetworkImage(
                            "${Api.baseUrl2}${widget.data['image']}"),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        widget.data["name"],
                        style: Theme.of(context).textTheme.bodyLarge,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        widget.data["shop_name"],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        '${widget.data["price"].toString()} E£',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                      color: TColors.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.cardRadiuslg),
                        bottomRight: Radius.circular(TSizes.productImageRadius),
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
              ),
              Positioned(
                  top: 1,
                  right: 0,
                  child: TCircularIcon(
                      onPressed: () {
                        _WishlistAdd.addToWishlist(id: '${widget.data["id"]}');
                      },
                      icon: Iconsax.heart,
                      color: Colors.blueGrey))
            ],
          ),
        ),
      ),
    );
  }
}
