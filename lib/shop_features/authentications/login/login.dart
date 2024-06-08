import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_saver/utils/theme/custom_themes/elevated_botton_theme.dart';
import 'package:food_saver/features/authentications/screens/login/widgets/login_header.dart';
import 'package:food_saver/shop_features/authentications/widgets/Clogin_form.dart';
import 'package:food_saver/features/authentications/screens/login/widgets/social_botton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_saver/cubit/auth_cubit.dart';
import 'package:food_saver/cubit/auth_state.dart';
import 'package:food_saver/features/presentation/screens/home screen/home_page.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/common/styles/spacing_styles.dart';

class CloginScreen extends StatefulWidget {
  CloginScreen({super.key});

  @override
  State<CloginScreen> createState() => _CloginScreenState();
}

class _CloginScreenState extends State<CloginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(children: [
          SizedBox(
            height: 60,
          ),
          TLoginHeader(),
          CLoginForm(),

          // footer
        ]),
      )),
    );
  }
}
