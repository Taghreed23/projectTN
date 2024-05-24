import 'package:flutter/material.dart';
import 'package:food_saver/core/Di.dart';
import 'package:food_saver/core/Sh.dart';
import 'package:food_saver/features/authentications/screens/signup/widgets/signup.dart';
import 'package:food_saver/features/presentation/screens/category_screen/category_screen.dart';
import 'package:food_saver/features/presentation/screens/home%20screen/navigation_bar.dart';
import 'package:food_saver/features/presentation/screens/wishlist_screen.dart';
import 'package:get/get.dart';
import 'package:food_saver/features/authentications/screens/login/login.dart';
import 'package:food_saver/utils/theme/custom_themes/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:food_saver/features/presentation/screens/home screen/home_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
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
  final token =
      sl<MySharedPrefInterface>().getString(key: MySharedKeys.apiToken);
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
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Expanded(
              child: LottieBuilder.asset(
                  'assets/splash_screen/VID 20240516 WA0044.json')),
        ],
      ),
      nextScreen: token == ""
          ? loginScreen()
          : Scaffold(
              bottomNavigationBar: My_navigationBar(),
            ),
      backgroundColor: Colors.black,
      // THelperFunctions.isDarkMode(context)
      //     ? TColors.darkerGrey
      //     : TColors.light,

      splashIconSize: 1000,
      animationDuration: const Duration(seconds: 3),
    );
  }
}
