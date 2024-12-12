import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF0FF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              const Text(
                'Let\'s Start With',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Register!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800),
              ),
              const SizedBox(height: 20),
              // Input Fields
              _buildTextField('Name', TextInputType.name),
              _buildTextField('Email Address', TextInputType.emailAddress),
              _buildTextField('Password', TextInputType.visiblePassword,
                  obscureText: true),
              _buildTextField('Confirm Password', TextInputType.visiblePassword,
                  obscureText: true),
              _buildPhoneNumberField(),
              const SizedBox(height: 10),
              // Privacy Policy Checkbox
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'By creating an account, I agree to the ',
                        children: [
                          TextSpan(
                            text: 'privacy & policy',
                            style: TextStyle(color: Colors.blue.shade800),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Center(
                child: Text(
                  'Or registered with',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialIcon('assets/icons/img.png'),
                  const SizedBox(width: 20),
                  _buildSocialIcon('assets/icons/img_1.png'),
                  const SizedBox(width: 20),
                  _buildSocialIcon('assets/icons/img_2.png'),
                  const SizedBox(width: 20),
                  _buildSocialIcon('assets/icons/img_3.png'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.login);
                  }, child: const Text("Login"))
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextInputType inputType,
      {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        keyboardType: inputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        ),
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              prefixText: '+91',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: 'Mobile Number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return InkWell(
      onTap: () {},
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        child: Image.asset(
          assetPath,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
