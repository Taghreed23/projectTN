import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_saver/features/presentation/model/offer_model.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/features/presentation/widgets/offer_tile.dart';
import 'package:iconsax/iconsax.dart';
import 'package:food_saver/data/network/home_request.dart';

class OfferListView extends StatefulWidget {
  const OfferListView({super.key});

  @override
  State<OfferListView> createState() => _OfferListViewState();
}

class _OfferListViewState extends State<OfferListView> {
  List<String> favorites = [];

  HomeRequest _homeData = HomeRequest();

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
    return FutureBuilder(
      future: _homeData.getHomeData(),
      builder: (context, AsyncSnapshot<dynamic>? snapshot) {
        if (snapshot!.hasError) {
          print(snapshot.error);
          print(snapshot.data);
          return Center(
            child: Text("Error while getting data"),
          );
        } else {
          if (snapshot.hasData) {
            //print(snapshot.data);
            // print(snapshot.data.length);

            return SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: TSizes.gridViewSpacing,
                  mainAxisSpacing: TSizes.gridViewSpacing,
                  mainAxisExtent: 288),
              delegate: SliverChildBuilderDelegate(childCount: 2,
                  (BuildContext context, dynamic index) {
                String offer = 'Offer $index';
                bool isFavorite = favorites.contains(offer);
                return Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: HerzontalOfferTile(
                    onPressed: () {
                      isFavorite
                          ? removeFromFavorites(offer)
                          : addToFavorites(offer);
                    },
                    color: isFavorite ? Colors.red : Colors.grey.shade600,
                    icon: isFavorite ? Iconsax.heart5 : Icons.favorite_border,
                  ),
                );
              }),
            );
          } else if (!snapshot.hasData) {
            return Center(child: Text("no data"));
          } else {
            return CircularProgressIndicator();
          }
        }
      },
    );

    /*SliverGrid(
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
          child: FutureBuilder(
            future: _homeData.getHomeData(),
            builder: (context, snapshot) {
              return HerzontalOfferTile(
                onPressed: () {
                  isFavorite
                      ? removeFromFavorites(offer)
                      : addToFavorites(offer);
                },
                color: isFavorite ? Colors.red : Colors.grey.shade600,
                icon: isFavorite ? Iconsax.heart5 : Icons.favorite_border,
              );
            },
          ),
        );
      }),*/
  }
}
