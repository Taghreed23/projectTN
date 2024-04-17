import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/personalization/screens/cart_screen/c_widget/cart_items.dart';
import 'package:t_store/features/personalization/screens/cart_screen/c_widget/product_price.dart';
import 'package:t_store/features/personalization/screens/cart_screen/c_widget/product_quntity_button.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: ListView.separated(
              separatorBuilder: (_, __) => const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              shrinkWrap: true,
              itemCount: 10,
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
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () {}, child: Text('CheckOut \$40.0')),
      ),
    );
  }
}
