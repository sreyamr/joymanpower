import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utlis/decoratedTextFiled.dart';

class SocialMediaScreen extends StatelessWidget {
  const SocialMediaScreen({super.key});

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
                    decoratedTextField(labelText: 'Social Media'),
                    decoratedTextField(labelText: 'Link URL'),
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
 Widget buildButton(BuildContext context){
    return   Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Delete',style: TextStyle(color: Colors.grey, fontSize: 16)),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade800,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text('Save',style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ],
      ),
    );
 }
}
