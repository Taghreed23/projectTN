import 'package:flutter/material.dart';
import 'package:food_saver/features/presentation/screens/wishlist_screen/provider/provider_state.dart';
import 'package:food_saver/features/presentation/screens/wishlist_screen/views/wishlist_list_view.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:food_saver/features/presentation/screens/category_screen/views/category__list_Builder.dart';
import 'package:provider/provider.dart';

class wishlistScreen extends StatelessWidget {
  const wishlistScreen({super.key});

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
          'My WishList',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: darkMode ? Colors.white : Colors.black),
        ),
      ),
      body: ChangeNotifierProvider(
          create: (context) => MyState(),
          child: MaterialApp(
              home: CustomScrollView(slivers: [WishlistListView()]))),
    );
  }
}
