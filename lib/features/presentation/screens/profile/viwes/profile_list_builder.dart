import 'package:flutter/material.dart';
import 'package:food_saver/data/network/profile/profile_request.dart';
import 'package:food_saver/features/presentation/screens/profile/widgets/profile_card.dart';

class ProfileListBuilder extends StatefulWidget {
  ProfileListBuilder({super.key});

  @override
  State<ProfileListBuilder> createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileListBuilder> {
  ProfileRequest _ProfileData = ProfileRequest();
  var future;
  @override
  void initState() {
    super.initState();
    future = _ProfileData.getProfileData();
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
              return SliverToBoxAdapter(
                child: profileCard(
                  data: snapshot.data!,
                ),
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

/*

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
              delegate: SliverChildBuilderDelegate(childCount: snapshot.data.length,
                  (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: HerzontalOfferTile(
                    onPressed: () {},
                    color: Colors.red,
                    icon: Iconsax.heart5,
                  ),
                );
              }),
            );
          } else if (snapshot.hasData) {
            return Center(child: Text("no data"));
          } else {
            return CircularProgressIndicator();
          }*/

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
