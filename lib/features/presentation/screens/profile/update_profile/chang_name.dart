// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:food_saver/data/network/profile/prifile_update_request.dart';
import 'package:iconsax/iconsax.dart';

import 'package:food_saver/features/authentications/widgets/my_button.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/utils/constants/text_strings.dart';

class changePhoneNunber extends StatefulWidget {
  changePhoneNunber({
    Key? key,
    required this.Name,
    required this.email,
    required this.gender,
  
    required this.birthday,
  }) : super(key: key);
  final String Name;
  final String email;
  final String gender;
  
  final String birthday;

  @override
  State<changePhoneNunber> createState() => _changeNameState();
}

class _changeNameState extends State<changePhoneNunber> {
  GlobalKey<FormState> formNameKey = GlobalKey<FormState>();

  TextEditingController PhpneNoUpdatController = TextEditingController();
  profileUpdateRequest _UpdateProfileData = profileUpdateRequest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Use real name for easy verification . ',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Form(
                key: formNameKey,
                child: Column(
                  children: [
                    TextFormField(
                      key: formNameKey,
                      controller: PhpneNoUpdatController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your New  Name';
                        }
                        return null;
                      },
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: 'Name', prefixIcon: Icon(Iconsax.user)),
                    )
                  ],
                )),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
                width: double.infinity,
                child: My_Button(
                  onPressed: () {
                    if (formNameKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();

                      _UpdateProfileData.updateProfileData(
                          email: widget.email,
                          name: PhpneNoUpdatController.toString(),
                          phone_number: widget.Name,
                          birthday: widget.birthday,
                          gender: widget.gender,
                       );
                    }
                  },
                  label: "Save",
                ))
          ],
        ),
      ),
    );
  }
}
