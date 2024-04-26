import 'package:flutter/material.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/c_widget/cart_items.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/c_widget/product_price.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/c_widget/product_quntity_button.dart';
import 'package:food_saver/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      //AppBar(
      //title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      //),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 5,
            separatorBuilder: (_, __) => const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            itemBuilder: (_, index) => Column(
              children: [
                CartItem(),
                SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 70,
                        ),
                        ProductQuantityaddRemoveButton(),
                      ],
                    ),
                    ProductPriceText(price: '50'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () {}, child: Text('CheckOut \$40.0')),
      ),
    );
  }
}
