import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentications/screens/login/login.dart';
import 'package:t_store/utils/theme/custom_themes/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      routes: {'LoginPage': (context) => loginScreen()},
      initialRoute: 'LoginPage',
    );
  }
}
