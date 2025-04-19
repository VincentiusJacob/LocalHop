import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _EditProfilePage();
}

class _EditProfilePage extends State<EditProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 24), 
                  const Text(
                    'Your name',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Avatar sama email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/profile.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.edit, color: Colors.purple, size: 20),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Your name", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("yourname@gmail.com", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Info fields
            _buildInfoRow("Name", "your name"),
            _buildInfoRow("Email account", "yourname@gmail.com"),
            _buildInfoRow("Mobile number", "Add number"),
            _buildInfoRow("Location", "USA"),

            const Spacer(),

            // Save Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Save Change"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
