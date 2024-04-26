import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_saver/features/presentation/screens/home screen/viwes/categories_list_view.dart';
import 'package:food_saver/features/presentation/screens/home screen/widgets/foodSaving_card.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:food_saver/features/presentation/widgets/offer_tile.dart';
import 'package:food_saver/features/presentation/widgets/offer_list.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:food_saver/features/presentation/screens/wishlist_screen.dart';
import 'package:get/get.dart';
import 'package:food_saver/features/presentation/screens/home screen/home_page.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/cart_screen_items.dart';
import 'package:food_saver/features/presentation/screens/home screen/navigation_bar.dart';

class homeScreen extends StatefulWidget {
  homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Food',
                style: TextStyle(color: darkMode ? Colors.white : Colors.black),
              ),
              Text(
                'Saver',
                style: TextStyle(color: Color(0xFFCF5051)),
              ),
            ],
          ),
        ),
      ),
      //   bottomNavigationBar: My_navigationBar(),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: foodsaving_card(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 12.0, bottom: 16, top: 16),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: CategoriesListView()),
            SliverToBoxAdapter(
              child: Divider(
                height: 40,
                thickness: 1,
                color: Colors.grey,
                endIndent: 60,
                indent: 60,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 12.0, bottom: 16, top: 5),
                child: Text(
                  'Running Out',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            OfferListView(),
          ],
        ),
      ),
    );
  }
}
