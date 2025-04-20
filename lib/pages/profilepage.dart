import 'package:flutter/material.dart';
import 'package:flutter_app_demo/model/user_model.dart';
import 'editprofile.dart';
import 'settingspage.dart';
import 'package:flutter_app_demo/pages/landingpage.dart';

class ProfilePage extends StatefulWidget {
  final UserModel? user;
 
  const ProfilePage({super.key,this.user});

  

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  

  
  bool _notificationsAllowed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Local',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF5C2EBC),
                  fontFamily: 'Montserrat',
                ),
              ),
              TextSpan(
                text: 'Hop!',
                style: TextStyle(
                  fontSize: 22,
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
                  backgroundImage: AssetImage(
                    'assets/images/profilepicture.jpeg',
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                       widget.user?.name ?? "No name",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      widget.user?.email ??"NoEmail@gmail.com",
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
                MaterialPageRoute(
                  builder: (context) => const EditProfilePage(),
                ),
              );
            },
          ),
          _buildListTile(
            icon: Icons.settings_outlined,
            text: "Settings",
            trailing: Icons.chevron_right,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
          _buildListTile(
            icon: Icons.notifications_none,
            text: "Notification",
            trailingWidget: PopupMenuButton<String>(
              onSelected: (value) {
                setState(() {
                  _notificationsAllowed = value == "Allow";
                });
              },
              itemBuilder:
                  (context) => [
                    const PopupMenuItem(value: "Allow", child: Text("Allow")),
                    const PopupMenuItem(value: "Mute", child: Text("Mute")),
                  ],
              child: Text(
                _notificationsAllowed ? "Allow" : "Mute",
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            onTap: () {},
          ),

          _buildListTile(
            icon: Icons.logout,
            text: "Log Out",
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Landingpage()),
              );
            },
          ),
        ],
      ),
    );
  }

  //notif toggle
  void showNotificationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 32.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _notificationsAllowed = true;
                    });
                    Navigator.pop(context);
                  },
                  child: const Text("Allow", style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _notificationsAllowed = false;
                    });
                    Navigator.pop(context);
                  },
                  child: const Text("Mute", style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String text,
    IconData? trailing,
    String? trailingText,
    Widget? trailingWidget,

    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(text),
      trailing:
          trailingWidget ??
          (trailing != null
              ? Icon(trailing, color: Colors.deepPurple)
              : trailingText != null
              ? Text(trailingText, style: const TextStyle(color: Colors.grey))
              : null),

      onTap: onTap,
    );
  }
}
