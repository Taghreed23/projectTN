import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/theme/custom_themes/elevated_botton_theme.dart';
import 'package:t_store/features/authentications/screens/login/widgets/login_header.dart';
import 'package:t_store/features/authentications/screens/login/widgets/login_form.dart';
import 'package:t_store/features/authentications/screens/login/widgets/social_botton.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

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
          TLoginForm(),
          // footer
          TSocialButton()
        ]),
      )),
    );
  }
}
