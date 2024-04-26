import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_saver/features/presentation/model/offer_model.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/features/presentation/widgets/offer_tile.dart';
import 'package:iconsax/iconsax.dart';

class OfferListView extends StatefulWidget {
  const OfferListView({super.key});

  @override
  State<OfferListView> createState() => _OfferListViewState();
}

class _OfferListViewState extends State<OfferListView> {
  List<String> favorites = [];

  void addToFavorites(String offer) {
    setState(() {
      favorites.add(offer);
    });
  }

  void removeFromFavorites(String offer) {
    setState(() {
      favorites.remove(offer);
    });
  }

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
        String offer = 'Offer $index';
        bool isFavorite = favorites.contains(offer);
        return Padding(
          padding: const EdgeInsets.only(right: 14),
          child: HerzontalOfferTile(
            onPressed: () {
              isFavorite ? removeFromFavorites(offer) : addToFavorites(offer);
            },
            color: isFavorite ? Colors.red : Colors.grey.shade600,
            icon: isFavorite ? Iconsax.heart5 : Icons.favorite_border,
          ),
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
