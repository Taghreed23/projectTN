import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/features/authentications/screens/login/login.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class verifyEmailScreen extends StatelessWidget {
  const verifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const loginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(children: [
          Image(
            image: const AssetImage(TImages.deliveredEmailIllustration),
            width: THelperFunctions.screenWidth() * 0.6,
          ),
          SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          // title
          Text(
            TTexts.confirmEmail,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          Text(
            TTexts.confirmEmailSubTitle,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          // Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const SuccessScreen()),
              child: const Text(TTexts.tContinue),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => Get.to(() => const loginScreen()),
              child: const Text(TTexts.resendEmail),
            ),
          )
        ]),
      )),
    );
  }
}
