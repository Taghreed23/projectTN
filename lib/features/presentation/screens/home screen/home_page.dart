import 'package:flutter/material.dart';
import 'package:food_saver/features/presentation/screens/home screen/viwes/categories_list_view.dart';
import 'package:food_saver/features/presentation/screens/home screen/widgets/foodSaving_card.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:food_saver/features/presentation/widgets/offer_tile.dart';
import 'package:food_saver/features/presentation/widgets/offer_list.dart';

class homeScreen extends StatelessWidget {
  homeScreen({super.key});
  final items = <Widget>[
    Icon(Icons.home, size: 30),
    Icon(Icons.search, size: 30),
    Icon(Icons.favorite, size: 30),
    Icon(Icons.shopping_cart, size: 30),
    Icon(Icons.person, size: 30),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Food',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Saver',
              style: TextStyle(color: Color(0xFFCF5051)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        backgroundColor: Color(0xFFCF5051),
      ),
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
