import 'package:flutter/material.dart';

class HomeAvatarSkillCardUi extends StatelessWidget {
  const HomeAvatarSkillCardUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 434,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: const LinearGradient(
          colors: [Color(0xFFFF6C6C), Color(0xFF894EFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/avatar_skill.png',
              width: 161,
              height: 234,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Skills",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Chip(elevation: 3, label: Text("Flutter")),
                    Chip(elevation: 3, label: Text("Dart")),
                    Chip(elevation: 3, label: Text("Firebase")),
                    Chip(elevation: 3, label: Text("Git")),
                    Chip(elevation: 3, label: Text("REST API")),
                    Chip(elevation: 3, label: Text("UI/UX Design")),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
