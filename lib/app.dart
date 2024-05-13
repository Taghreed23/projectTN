import 'package:flutter/material.dart';
import 'package:food_saver/features/authentications/screens/signup/widgets/signup.dart';
import 'package:food_saver/features/presentation/screens/home%20screen/navigation_bar.dart';
import 'package:food_saver/features/presentation/screens/wishlist_screen.dart';
import 'package:get/get.dart';
import 'package:food_saver/features/authentications/screens/login/login.dart';
import 'package:food_saver/utils/theme/custom_themes/theme.dart';

import 'package:food_saver/features/presentation/screens/home screen/home_page.dart';
import 'package:food_saver/features/presentation/screens/offer_card_screen/offer_detalies_screen.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/cart_screen_items.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/c_widget/cart_items.dart';
import 'package:food_saver/customer features/presentation/Screens/add_offer.dart';
import 'package:food_saver/customer features/presentation/Screens/home_page.dart';
import 'package:food_saver/features/authentications/screens/signup/widgets/verify_email.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      /*routes: {
        'loginScreen': (context) => loginScreen(),
        'SignupScreen': (context) => SignupScreen(),
        'homeScreen': (context) => homeScreen(),
        'verifyEmailScreen': (context) => verifyEmailScreen(),
      },
      initialRoute: 'SignupScreen',*/

      home: Scaffold(
        bottomNavigationBar: My_navigationBar(),
      ),
      /*routes: {
        'homeScreen': (context) => homeScreen(),
        'favListView': (context) => favListView(),
        'CartScreen': (context) => CartScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'homeScreen',*/
    );
  }
}
