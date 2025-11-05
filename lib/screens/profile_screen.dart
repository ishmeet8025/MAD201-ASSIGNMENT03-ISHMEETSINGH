import 'package:flutter/material.dart';
Text("R C", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
Text("work.ishmeet.26@gmail.com"),
/// Static Profile Screen
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/posters/profile.jpg')),
          SizedBox(height: 16),
          Text("Your Name", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text("youremail@example.com"),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "I love exploring new movies and learning app development!",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
