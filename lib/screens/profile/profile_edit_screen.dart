import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joymanpower/config/app_controller.dart';
import '../../utlis/decoratedTextFiled.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.blue.shade100,
                          child: const Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(width: 16),
                       buildButton(),
                      ],
                    ),
                    const SizedBox(height: 16),
                    decoratedTextField(labelText: 'Full Name', controller: _nameController),
                    decoratedTextField(labelText: 'Designation', controller: _designationController),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: _updateProfileData,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade800,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: const Text('Update New',style: TextStyle(color: Colors.white),),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Remove',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }


  void _updateProfileData() async {
    final updatedName = _nameController.text.trim();
    final updatedDesignation = _designationController.text.trim();

    if (updatedName.isEmpty || updatedDesignation.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Name and Designation cannot be empty')),
      );
      return;
    }

    await AppController.updateRegisterData(
      name: updatedName,
      designation: updatedDesignation,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully')),
    );
    Navigator.pop(context, true);
  }

}
