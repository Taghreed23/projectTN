import 'package:flutter/material.dart';
import 'package:food_saver/features/presentation/screens/profile/widgets/section_handealing.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/features/presentation/screens/profile/widgets/profile_menu.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Profile',
          style: TextStyle(color: darkMode ? Colors.white : Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      padding: EdgeInsets.all(TSizes.sm),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/content/user.png')
                                as ImageProvider),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text('change profile picture'))
                  ],
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const sectionHeading(
                title: 'profile Informatiom',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              ProfileMenu(
                title: 'Name',
                value: 'Taghreed',
                onPressed: () {},
              ),
              ProfileMenu(
                  onPressed: () {}, title: 'username', value: 'taghreed23'),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const sectionHeading(
                title: 'Personal Informatiom',
                showActionButton: false,
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'User Id',
                value: '232003',
                icon: Iconsax.copy,
              ),
              ProfileMenu(
                  onPressed: () {},
                  title: 'Email',
                  value: 'taghredkhaled74@gmail.com'),
              ProfileMenu(
                  onPressed: () {},
                  title: 'Phone Number',
                  value: '01005112056'),
              ProfileMenu(onPressed: () {}, title: 'Gender', value: 'female'),
              ProfileMenu(
                  onPressed: () {},
                  title: 'Date of Birth',
                  value: '2 march 2003'),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Close Account',
                    style: TextStyle(color: Color(0xFFCF5051)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
