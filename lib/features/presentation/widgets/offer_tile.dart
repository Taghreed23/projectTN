import 'package:flutter/material.dart';
import 'package:food_saver/features/presentation/model/offer_model.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:food_saver/common/widgets/circular_icons.dart';
import 'package:iconsax/iconsax.dart';

// cached network image
class OfferTile extends StatelessWidget {
  OfferTile({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
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
                  color: dark ? TColors.dark : TColors.light,
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
                            image: AssetImage('assets/categories/Bakery.jpg')),
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
                    child: Text(
                      'Time',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.black),
                    ),
                  ),
                ),

                // fav
                const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ))
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
                    'offer small details',
                    style: Theme.of(context).textTheme.labelLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  // resturant name
                  Row(
                    children: [
                      Text(
                        'Resturant Name',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
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
                        'price £E',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: TColors.dark,
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
/* GestureDetector(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Container color
          borderRadius: BorderRadius.circular(20), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(3, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/categories/meals.jpg',
                        ),
                        fit: BoxFit.fill),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton.icon(
                        label: Text(''),
                        onPressed: () {},
                        icon: Icon(Icons.favorite)),
                  ),
                ),
                // Replace with your image URL
                Center(
                  child: Text(
                    'Beef Burger',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                Text('Cheesy Mozzarella'),
                Row(
                  children: [Text('price'), Text('time')],
                ),
                // Add more widgets for other elements as needed
              ],
            ),
          ),
        ),
      ),
    )*/
/*Expanded(
              child: Column(
                children: [
                  Image.asset('assets/images/cupcake.jpg', height: 10),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      'Cupcakes',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('50 egp')
                ],
              ),
            ),*/

/*Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              offerModel.image!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            )),
        const SizedBox(
          height: 12,
        ),
        Text(
          offerModel.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          offerModel.subTitle ?? '',
          maxLines: 2,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        )
      ],
    );*/
