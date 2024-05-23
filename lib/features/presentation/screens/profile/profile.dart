import 'package:flutter/material.dart';
import 'package:food_saver/features/presentation/screens/profile/viwes/profile_list_builder.dart';
import 'package:food_saver/features/presentation/screens/profile/viwes/profile_list_builder.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:food_saver/features/presentation/screens/category_screen/views/category__list_Builder.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Profile',
          style: TextStyle(color: darkMode ? Colors.white : Colors.black),
        ),
      ),
      body: CustomScrollView(slivers: [
        ProfileListBuilder(),
      ]),
    );
  }
}
