import 'package:flutter/material.dart';

import '../config/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF0FF),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitleSection(),
              const SizedBox(height: 32),
              buildInputField("Email Address"),
              const SizedBox(height: 16),
              buildInputField("Password", obscureText: true),
              const SizedBox(height: 8),
              buildForgotPassword(),
              const SizedBox(height: 24),
              buildLoginButton(context),
              const SizedBox(height: 24),
              buildRegisterText(context),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildTitleSection() {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Let’s Start With",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: Colors.black87),
        ),
        Text(
          "Login!",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color:  Colors.blue.shade800),
        ),
      ],
    );
  }


  Widget buildInputField(String label, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }


  Widget buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // TODO: Add Forgot Password Logic
        },
        child:  Text("Forgot Password?", style: TextStyle(color: Colors.blue.shade800)),
      ),
    );
  }


  Widget buildLoginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.home);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade800,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: const Text(
          "Login",
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget buildRegisterText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Don't have an account?", style:  TextStyle(color: Colors.grey),),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.register);
            },
            child: Text(
              "Register",
              style: TextStyle(
                color: Colors.blue.shade800,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
  }
}
