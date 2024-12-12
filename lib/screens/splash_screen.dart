import 'package:flutter/material.dart';

import '../config/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int pageIndex = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (value) {
              setState(() {
                pageIndex = value;
              });
            },
            children: [
              buildPage(
                image: 'assets/splash/img.png',
                title: 'Explore Opportunities',
                subtitle:
                'Finding a job that aligns with the individual\'s skills and career goals, adding a sense of personalization to the job search experience.',
              ),
              buildPage(
                image: 'assets/splash/img_1.png',
                title: 'Apply with Ease',
                subtitle:
                'Finding a job that aligns with the individual\'s skills and career goals, adding a sense of personalization to the job search experience.',
              ),
              buildPage(
                image: 'assets/splash/img_2.png',
                title: 'Your New Beginning',
                subtitle:
                'Finding a job that aligns with the individual\'s skills and career goals, adding a sense of personalization to the job search experience.',
              ),
            ],
          ),
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: () {
                // Handle skip button logic here
                controller.jumpToPage(2);
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  color: Colors.blue.shade800,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 20,
            right: 20,
            child: Column(
              children: [
                buildPageIndicator(),
                const SizedBox(height: 16),
                buildBottomButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Page Layout
  Widget buildPage({
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 300,
        ),
        const SizedBox(height: 20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  // Page Indicator
  Widget buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
            (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: pageIndex == index ? 20 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: pageIndex == index ? Colors.blue : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }


  Widget buildBottomButton() {
    return ElevatedButton(
      onPressed: () {
        if (pageIndex < 2) {
          controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut);
        } else {
          Navigator.pushNamed(context, AppRoutes.login);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:Colors.blue.shade800,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        pageIndex == 2 ? "Start" : "Next",
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
