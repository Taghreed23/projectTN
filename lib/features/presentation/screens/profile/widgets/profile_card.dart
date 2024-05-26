import 'package:flutter/material.dart';
import 'package:food_saver/data/network/api.dart';
import 'package:food_saver/features/presentation/screens/profile/update_profile/change_Gender.dart';
import 'package:food_saver/features/presentation/screens/profile/update_profile/change_birthday.dart';
import 'package:food_saver/features/presentation/screens/profile/update_profile/change_email.dart';
import 'package:food_saver/features/presentation/screens/profile/update_profile/changephoNO_name.dart';
import 'package:food_saver/features/presentation/screens/profile/widgets/section_handealing.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/features/presentation/screens/profile/widgets/profile_menu.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';

class profileCard extends StatefulWidget {
  const profileCard({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<profileCard> createState() => _profileCardState();
}

class _profileCardState extends State<profileCard> {
  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor:
                      darkMode ? Colors.grey.shade500 : Colors.white,
                  child: CircleAvatar(
                    radius: 42,
                    backgroundImage: NetworkImage("${Api.baseUrl2}${widget.data['image']}"??'data:image/jpeg;base64,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'),
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
            value: '',
            onPressed: () {},
          ),
          ProfileMenu(
            onPressed: () {},
            title: 'username',
            value: widget.data["username"],
          ),
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
            value: widget.data["id"].toString(),
            icon: Iconsax.copy,
          ),
          ProfileMenu(
              onPressed: () {
                setState(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return changeEmail(
                          birthday: widget.data["birthday"],
                          gender: widget.data["gender"],
                          phoneNo: widget.data["phone_number"],
                        );
                      },
                    ),
                  );
                });
              },
              title: 'Email',
              value: widget.data["email"]),
          ProfileMenu(
            title: 'Phone Number',
            value: widget.data["phone_number"],
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return changePhoneN0(
                      birthday: widget.data["birthday"],
                      gender: widget.data["gender"],
                      email: widget.data["email"],
                    );
                    
                  },
                ),
              );
            },
          ),
          ProfileMenu(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return changeGender(
                        birthday: widget.data["birthday"],
                        email: widget.data["email"],
                        phoneNo: widget.data["phone_number"],
                      );
                    },
                  ),
                );
              },
              title: 'Gender',
              value: widget.data["gender"]),
          ProfileMenu(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return changeBirth(
                        email: widget.data["email"],
                        gender: widget.data["gender"],
                        PhoneNO: widget.data["phone_number"],
                      );
                      setState(() {});
                    },
                  ),
                );
              },
              title: 'Date of Birth',
              value: widget.data["birthday"]),
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
    );
  }
}
