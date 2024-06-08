import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter/rendering.dart';
import 'package:food_saver/features/presentation/screens/category_screen/widgets/category_tail.dart';
import 'package:food_saver/features/presentation/screens/previous_orders_screen/widgets/previous_tile.dart';
import 'package:food_saver/shop_features/presentation/Screens/orders_screen/order_date/widget/order_date_tile.dart';
import 'package:food_saver/utils/constants/sizes.dart';

class SOrderDateListView extends StatelessWidget {
  SOrderDateListView({super.key, required this.data});
  final List<dynamic> data;

  @override
  Widget build(BuildContext context) {
    log("all items is : $data");
    return SliverList(
      
        delegate: SliverChildBuilderDelegate(childCount: data.length,
            (context, index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 22),
        child: SorderDateTile(
          data: data[index],
        ),
      );
    }));
  }
}