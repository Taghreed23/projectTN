import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_saver/features/presentation/model/offer_model.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/features/presentation/widgets/offer_tile.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class favListView extends StatefulWidget {
  const favListView({super.key});

  @override
  State<favListView> createState() => _favListViewState();
}

class _favListViewState extends State<favListView> {
  List<String> favorites = [];
  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'My Wishlist',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: darkMode ? Colors.white : Colors.black),
        ),
      ),
      body: CustomScrollView(slivers: [
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: TSizes.gridViewSpacing,
              mainAxisSpacing: TSizes.gridViewSpacing,
              mainAxisExtent: 288),
          delegate: SliverChildBuilderDelegate(childCount: 8,
              (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right: 14),
              child: HerzontalOfferTile(
                color: Colors.red,
                icon: Iconsax.heart5,
                onPressed: () {},
              ),
            );
          }),
        ),
      ]),
    );
  }
}
