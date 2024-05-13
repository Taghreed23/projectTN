import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:food_saver/common/styles/spacing_styles.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/constants/image_strings.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/utils/constants/text_strings.dart';
import 'package:food_saver/utils/theme/custom_themes/elevated_botton_theme.dart';
import 'package:food_saver/features/authentications/screens/login/widgets/login_header.dart';
import 'package:food_saver/features/authentications/screens/login/widgets/login_form.dart';
import 'package:food_saver/features/authentications/screens/login/widgets/social_botton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_saver/cubit/auth_cubit.dart';
import 'package:food_saver/cubit/auth_state.dart';
import 'package:food_saver/features/presentation/screens/home screen/home_page.dart';

class loginScreen extends StatefulWidget {
  loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(children: [
            SizedBox(
              height: 60,
            ),
            TLoginHeader(),
            TLoginForm(),

            // footer
          ]),
        )),
      ),
    );
  }
}
