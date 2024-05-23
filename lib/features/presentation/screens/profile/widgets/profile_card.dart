import 'package:flutter/material.dart';
import 'package:food_saver/data/network/api.dart';
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
                    backgroundImage:
                        NetworkImage("${Api.baseUrl2}${widget.data['image']}"),
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
            value: widget.data["name"],
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
              onPressed: () {}, title: 'Email', value: widget.data["email"]),
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
                    setState(() {});
                  },
                ),
              );
            },
          ),
          ProfileMenu(
              onPressed: () {}, title: 'Gender', value: widget.data["gender"]),
          ProfileMenu(
              onPressed: () {},
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
