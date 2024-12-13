import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utlis/decoratedTextFiled.dart';

class SocialMediaScreen extends StatefulWidget {
  const SocialMediaScreen({super.key});

  @override
  State<SocialMediaScreen> createState() => _SocialMediaScreenState();
}

class _SocialMediaScreenState extends State<SocialMediaScreen> {
  // Controllers for the input fields
  final TextEditingController socialMediaController = TextEditingController();
  final TextEditingController linkUrlController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    socialMediaController.dispose();
    linkUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Social Media',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Social Media field with controller
                    decoratedTextField(
                      labelText: 'Social Media',
                      controller: socialMediaController,
                    ),
                    // Link URL field with controller
                    decoratedTextField(
                      labelText: 'Link URL',
                      controller: linkUrlController,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          buildButton(context),
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              saveSocialMediaDetails();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade800,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  // Function to handle save action
  void saveSocialMediaDetails() {
    String socialMedia = socialMediaController.text;
    String linkUrl = linkUrlController.text;

    // For now, print the values (replace this with storage logic if needed)
    print('Social Media: $socialMedia');
    print('Link URL: $linkUrl');
  }
}
