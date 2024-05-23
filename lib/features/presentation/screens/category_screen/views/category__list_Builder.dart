import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_saver/features/presentation/screens/category_screen/widgets/category_tail.dart';

import 'package:food_saver/utils/constants/sizes.dart';

import 'package:iconsax/iconsax.dart';

import 'package:food_saver/features/presentation/model/offer_model.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/features/presentation/screens/category_screen/views/categoryProduct_view.dart';
import 'package:food_saver/data/network/category_request.dart';

class CategoryListBilder extends StatefulWidget {
  CategoryListBilder({super.key, required this.categoryId});
  final int categoryId;
  @override
  State<CategoryListBilder> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryListBilder> {
  CategoryRequest _CategoryData = CategoryRequest();
  var future;
  @override
  void initState() {
    super.initState();
    future = _CategoryData.getCategoryData(id: widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
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
              print('taghreed ${snapshot.data.length}');
              return ProductListView(
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
            return SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          }
        }
      },
    );
  }
}
