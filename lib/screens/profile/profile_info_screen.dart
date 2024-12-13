import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/app_controller.dart';
import '../../utlis/decoratedTextFiled.dart';

class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({super.key});

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  final TextEditingController mobileNumberController = TextEditingController();
final TextEditingController dateOfBirthController = TextEditingController();
final TextEditingController emailAddressController = TextEditingController();
final TextEditingController addressController = TextEditingController();



@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Personal Information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      decoratedTextField(labelText: 'Mobile Number', controller: mobileNumberController),
                      decoratedTextField(labelText: 'Date Of Birth', controller: dateOfBirthController),
                      decoratedTextField(labelText: 'Email Address', controller: emailAddressController),
                      decoratedTextField(labelText: 'Address', controller: addressController),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Delete',style: TextStyle(color: Colors.grey),),
                ),
                ElevatedButton(
                  onPressed:_updateProfileData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text('Save',style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _updateProfileData() async {
    final mobile = mobileNumberController.text.trim();
    final updatedDateOfBirth = dateOfBirthController.text.trim();
    final updatedEmail = emailAddressController.text.trim();

    if (mobile.isEmpty || updatedDateOfBirth.isEmpty || updatedEmail.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Phone, Date of Birth, and Email cannot be empty')),
      );
      return;
    }

    await AppController.updateProfile(
      phone: mobile,
      dateOfBirth: updatedDateOfBirth,
      email: updatedEmail,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully')),
    );
    Navigator.pop(context, true);
  }
}
