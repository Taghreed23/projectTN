import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_saver/features/presentation/screens/category_screen/widgets/category_tail.dart';
import 'package:food_saver/features/presentation/screens/previous_orders_screen/views/previous_order_view.dart';
import 'package:food_saver/features/presentation/screens/previous_orders_screen/widgets/previous_tile.dart';
import 'package:food_saver/shop_features/presentation/Screens/orders_screen/order_date/views/order_date_view.dart';
import 'dart:developer';
import 'package:food_saver/utils/constants/sizes.dart';

import 'package:iconsax/iconsax.dart';

import 'package:food_saver/features/presentation/model/offer_model.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/features/presentation/screens/category_screen/views/categoryProduct_view.dart';
import 'package:food_saver/data/network/category_request.dart';
import 'package:intl/intl.dart';

class SorderDateBilder extends StatefulWidget {
  SorderDateBilder({super.key, required this.future});

  var future;
  @override
  State<SorderDateBilder> createState() => _SorderDateBildertState();
}

class _SorderDateBildertState extends State<SorderDateBilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
      builder: (context, AsyncSnapshot<dynamic>? snapshot) {
        if (snapshot!.hasError) {
          print(snapshot.error);
          return SliverToBoxAdapter(
            child: Center(
              child: Text("Error while getting data"),
            ),
          );
        } else {
          if (snapshot.hasData) {
            if (snapshot.data.length > 0) {
              log('All carts ${snapshot.data.length}');
     
              // log('all data is ${snapshot.data!}');
              // log('first item is ${snapshot.data![0]['items'][0]}');
              return SOrderDateListView(
                data: snapshot.data!,
              );
              //
            } else {
              return SliverToBoxAdapter(
                child: Center(
                  child: Text("No Data"),
                ),
              );
            }
          } else {
            /*  */
            return SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          }
        }
      },
    );
  }
}