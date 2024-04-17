import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_saver/features/authentications/screens/login/login.dart';
import 'package:food_saver/utils/theme/custom_themes/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_saver/features/presentation/screens/home screen/home_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: homeScreen(),
      // routes: {'LoginPage': (context) => loginScreen()},
      // initialRoute: 'LoginPage',
    );
  }
}
