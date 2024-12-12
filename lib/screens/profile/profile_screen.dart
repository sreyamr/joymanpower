import 'package:flutter/material.dart';
import '../../config/routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: _buildAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildProfileCard(),
          const SizedBox(height: 16),
          _buildPersonalInfoCard(),
          const SizedBox(height: 16),
          _buildActionButtons(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Profile'),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
        ),
      ],
    );
  }

  Widget _buildProfileCard() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.blue.shade100,
              child: const Icon(Icons.person, size: 40, color: Colors.blue),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Aadhithya',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Influencer',
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                  ),
                  Divider(),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.mode_edit_outlined),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.profileEditScreen);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalInfoCard() {
    return Card(
      color: Colors.white,
      child: Column(
        children: [
          _buildListTile(
            title: 'Personal Information',
            isBold: true,
            trailingIcon: Icons.edit,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.profileInfoScreen);
            },
          ),
          const Divider(),
          const _InfoTile(title: 'Mobile Number', subtitle: '+97654786688'),
          const _InfoTile(title: 'Date of Birthday', subtitle: '06-06-2000'),
          const _InfoTile(
              title: 'Email Address',
              subtitle: 'aadhithayarunachalam@gmail.com'),
          _buildListTile(
            title: 'Social Media',
            isBold: true,
            trailingIcon: Icons.edit,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.socialMedia);
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          _buildSocialMediaIcons(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required String title,
    bool isBold = false,
    IconData? trailingIcon,
    VoidCallback? onPressed,
  }) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
      ),
      trailing: trailingIcon != null
          ? IconButton(icon: Icon(trailingIcon), onPressed: onPressed)
          : null,
    );
  }

  Widget _buildSocialMediaIcons() {
    final socialMediaIcons = [
      'assets/icons/img_1.png',
      'assets/icons/img_4.png',
      'assets/icons/img_3.png',
      'assets/icons/img_5.png',
    ];

    return Row(
      children: socialMediaIcons.map((path) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Image.asset(path, width: 40, height: 40),
        );
      }).toList(),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade800,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: const Text('Send Verification',
              style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const _InfoTile({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
    );
  }
}