import 'package:flutter/material.dart';
import 'editprofile.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Local',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF5C2EBC),
                ),
              ),
              TextSpan(
                text: ' Hop!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF99A3AB),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center, 
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                const SizedBox(width: 20), 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [
                    const Text(
                      "Your name",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      "yourname@gmail.com",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 30, thickness: 1),

         _buildListTile(
            icon: Icons.person_outline,
            text: "My Profile",
            trailing: Icons.chevron_right,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditProfilePage()),
              );
            },
          ),

          _buildListTile(
            icon: Icons.settings_outlined,
            text: "Settings",
            trailing: Icons.chevron_right,
            onTap: () {},
          ),
          _buildListTile(
            icon: Icons.notifications_none,
            text: "Notification",
            trailingText: "Allow",
            onTap: () {},
          ),
          _buildListTile(
            icon: Icons.logout,
            text: "Log Out",
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String text,
    IconData? trailing,
    String? trailingText,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(text),
      trailing: trailing != null
          ? Icon(trailing, color: Colors.deepPurple)
          : trailingText != null
              ? Text(trailingText, style: const TextStyle(color: Colors.grey))
              : null,
      onTap: onTap,
    );
  }
}
