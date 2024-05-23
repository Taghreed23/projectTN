import 'package:flutter/material.dart';
import 'package:food_saver/data/network/cart/cart_request.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/c_widget/cart_items.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/c_widget/product_price.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/c_widget/product_quntity_button.dart';

import 'package:food_saver/utils/constants/sizes.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var future;
  CartListRequest _carttData = CartListRequest();
  @override
  void initState() {
    super.initState();
    future = _carttData.getCartData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      //AppBar(
      //title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      //),
      body: FutureBuilder(
          future: future,
          builder: (context, AsyncSnapshot<dynamic>? snapshot) {
            if (snapshot!.hasError) {
              print(snapshot.error);
              return Center(
                child: Text("Error while getting data"),
              );
            } else {
              if (snapshot.hasData) {
                if (snapshot.data.length > 0) {
                  print('taghreed ${snapshot.data.length}');
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        separatorBuilder: (_, __) => const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),
                        itemBuilder: (_, index) => Column(
                          children: [
                            CartItem(data: snapshot.data[index]),
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
                  );

                  //
                } else {
                  return Center(
                    child: Text("No Data"),
                  );
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () {}, child: Text('CheckOut \$40.0')),
      ),
    );
  }
}
