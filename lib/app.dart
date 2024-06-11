import 'package:flutter/material.dart';
import 'package:food_saver/core/Di.dart';
import 'package:food_saver/core/Sh.dart';
import 'package:food_saver/features/authentications/screens/signup/widgets/signup.dart';
import 'package:food_saver/features/presentation/screens/category_screen/category_screen.dart';
import 'package:food_saver/features/presentation/screens/home%20screen/navigation_bar.dart';
import 'package:food_saver/features/presentation/screens/previous_orders_screen/previous_orders.dart';
import 'package:food_saver/features/presentation/screens/wishlist_screen.dart';
import 'package:food_saver/shop_features/authentications/widgets/Clogin_form.dart';
import 'package:food_saver/shop_features/presentation/Screens/add_offer/add_offer.dart';
import 'package:food_saver/shop_features/presentation/Screens/orders_screen/all_orders.dart';
import 'package:food_saver/shop_features/presentation/Screens/orders_screen/new_order_Date.dart';
import 'package:food_saver/shop_features/presentation/Screens/products%20screen/All_products.dart';
import 'package:food_saver/shop_features/presentation/Screens/products%20screen/widgets/pruducts_tile.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:food_saver/features/authentications/screens/login/login.dart';
import 'package:food_saver/utils/theme/custom_themes/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:food_saver/features/presentation/screens/home screen/home_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/cart_screen_items.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/c_widget/cart_items.dart';

import 'package:food_saver/shop_features/presentation/Screens/home screen/home_page.dart';
import 'package:food_saver/features/authentications/screens/signup/widgets/verify_email.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  final token =
      sl<MySharedPrefInterface>().getString(key: MySharedKeys.apiToken);
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
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

      home: SplashSceen(),
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

class SplashSceen extends StatelessWidget {
  SplashSceen({super.key});
  final token =
      sl<MySharedPrefInterface>().getString(key: MySharedKeys.apiToken);
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Expanded(
              child: Container(
            child: LottieBuilder.asset(dark
                ? 'assets/splash_screen/VID 20240516 WA0044.json'
                : 'assets/splash_screen/WhatsApp Video 2024 06 08 at 3.39.02 PM (1).json'),
          )),
        ],
      ),
      nextScreen: CHomePage(),

      // token == ""
      //     ? loginScreen()
      //     : Scaffold(
      //         bottomNavigationBar: My_navigationBar(),
      //       ),

      // THelperFunctions.isDarkMode(context)
      //     ? TColors.darkerGrey
      //     : TColors.light,
      backgroundColor: dark ? Colors.black : Colors.white,
      splashIconSize: 1000,
      animationDuration: const Duration(seconds: 3),
    );
  }
}
