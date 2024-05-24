import 'package:flutter/material.dart';
import 'package:food_saver/data/network/cart/cart_request.dart';
import 'package:food_saver/data/network/cart/clear_cart_request.dart';
import 'package:food_saver/data/network/cart/del_product_from_cart.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/c_widget/cart_items.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/c_widget/product_price.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/c_widget/product_quntity_button.dart';

import 'package:food_saver/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var future;
  CartListRequest _carttData = CartListRequest();
  CartDelRequest _cartDelRequest = CartDelRequest();
  ClearCartRequest _clearCartRequest = ClearCartRequest();

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
                                      width: TSizes.iconlg * 1.2,
                                      height: TSizes.iconlg * 1.2,
                                      child: Center(
                                        child: IconButton(
                                          icon: Icon(Iconsax.trash,
                                              color: Colors.black),
                                          onPressed: () {
                                            _cartDelRequest.delFromwCart(
                                                id: snapshot.data[index]
                                                    ["product_id"]);
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    ProductQuantityaddRemoveButton(
                                      quantity: snapshot.data[index],
                                    ),
                                  ],
                                ),
                                ProductPriceText(
                                  data: snapshot.data[index]!,
                                ),
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
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('CheckOut \$40.0'),
              style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size(250, 70))),
            ),
            SizedBox(
              width: 30,
            ),
            Container(
              height: 100,
              width: 70,
              decoration: BoxDecoration(
                  color: Color(0xFFCF5051), shape: BoxShape.circle),
              child: SizedBox(
                width: TSizes.iconlg * 1.2,
                height: TSizes.iconlg * 1.2,
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Iconsax.trash,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _clearCartRequest.ClearCart();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
