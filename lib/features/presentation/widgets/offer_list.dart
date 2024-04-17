import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_saver/features/presentation/model/offer_model.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/features/presentation/widgets/offer_tile.dart';

class OfferListView extends StatelessWidget {
  const OfferListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: TSizes.gridViewSpacing,
          mainAxisSpacing: TSizes.gridViewSpacing,
          mainAxisExtent: 288),
      delegate: SliverChildBuilderDelegate(childCount: 8,
          (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(right: 14),
          child: OfferTile(),
        );
      }),
      /* child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 9 / 16),
          itemCount: 8,
          itemBuilder: (context, index) {
            return OfferTile();
          }),*/
    );
  }
}
