import 'package:flutter/material.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:food_saver/features/presentation/screens/category_screen/views/category__list_Builder.dart';

class categoryScreen extends StatelessWidget {
  const categoryScreen(
      {super.key, required this.categoryId, required this.categoryName});
  final int categoryId;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
           leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: darkMode ? TColors.light :TColors.primary,
          onPressed: () {
            Navigator.pop(context);

            // Navigate back to the previous screen
          },
        ),
        toolbarHeight: 70,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          categoryName,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: darkMode ? Colors.white : Colors.black),
        ),
      ),
      body: CustomScrollView(slivers: [
        CategoryListBilder(
          categoryId: categoryId,
        )
      ]),
    );
  }
}
