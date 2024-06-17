import 'package:flutter/material.dart';
import 'package:food_saver/data/shop_network/login_request.dart';
import 'package:food_saver/features/authentications/widgets/auth_text_field.dart';
import 'package:food_saver/features/authentications/widgets/my_button.dart';
import 'package:food_saver/shop_features/presentation/Screens/home screen/home_page.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';

class CLoginForm extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  SLoginRequest _shoplogin = SLoginRequest();
  CLoginForm({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              TAuthTextField(
                controller: emailController,
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.email),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              TAuthTextField(
                controller: passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: TTexts.password,
                  suffixIcon: Icon(Iconsax.eye_slash),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields / 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (Value) {}),
                      const Text(TTexts.rememberMe),
                    ],
                    //forget passowrd
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(TTexts.forgetPassword)),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // signin button

              SizedBox(
                  width: double.infinity,
                  child: My_Button(
                    onPressed: () {
                      _shoplogin.Shoplogin(
                          username: emailController.text,
                          password: passwordController.text);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return CHomePage();
                          },
                        ),
                      );
                 
                    },
                    label: TTexts.signIn,
                  )),
              // BlocConsumer<AuthCubit, AuthState>(
              //   listener: (context, state) {
              //     if (state is AuthError) {
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         SnackBar(
              //           content: Text(state.error),
              //           backgroundColor: Colors.red,
              //         ),
              //       );
              //     } else if (state is AuthLoaded) {
              //       Navigator.pushAndRemoveUntil(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => CHomePage(),
              //         ),
              //         (route) => false,
              //       );
              //     }
              //   },
              //   builder: (context, state) {
              //     return SizedBox(
              //       width: double.infinity,
              //       child: My_Button(
              //         onPressed: () {
              //           // if (formKey.currentState!.validate()) {
              //           //   FocusScope.of(context).unfocus();
              //           //   context.read<AuthCubit>().login(
              //           //         username: emailController.text,
              //           //         password: passwordController.text,
              //           //       );
              //           // }
              //         },
              //         label: TTexts.signIn,
              //         isLoading: state is AuthLoading,
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ));
  }
}
