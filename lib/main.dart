import 'package:flutter/material.dart';
import 'package:joymanpower/screens/home_screen.dart';
import 'package:joymanpower/screens/login_screen.dart';
import 'package:joymanpower/screens/profile/profile_edit_screen.dart';
import 'package:joymanpower/screens/profile/profile_info_screen.dart';
import 'package:joymanpower/screens/profile/profile_screen.dart';
import 'package:joymanpower/screens/profile/social_media_screen.dart';
import 'package:joymanpower/screens/register.dart';
import 'package:joymanpower/screens/splash_screen.dart';

import 'config/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: AppRoutes.splash,
      routes: getAppRoute(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
    );
  }

  Map<String,WidgetBuilder> getAppRoute(){
    return{
      AppRoutes.splash:(context)=> const SplashScreen(),
      AppRoutes.login:(context)=> const LoginScreen(),
      AppRoutes.register:(context)=> const RegisterScreen(),
      AppRoutes.home:(context)=> const HomeScreen(),
      AppRoutes.profile:(context)=> const ProfileScreen(),
      AppRoutes.socialMedia:(context)=> const SocialMediaScreen(),
      AppRoutes.profileInfoScreen:(context)=> const ProfileInfoScreen(),
      AppRoutes.profileEditScreen:(context)=> const ProfileEditScreen(),
    };
  }
}



