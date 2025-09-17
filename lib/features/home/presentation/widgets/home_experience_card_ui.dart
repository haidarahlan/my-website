import 'package:flutter/material.dart';

class HomeExperienceCardUi extends StatelessWidget {
  const HomeExperienceCardUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFF3F2B96), Color(0xFFA8C0FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Experience",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 12),
          ListTile(
            title:
                Text("Stevor Express", style: TextStyle(color: Colors.white)),
            subtitle: Text(
              "Flutter Developer – contract",
              style: TextStyle(color: Colors.white70),
            ),
            trailing: Text(
              "Jan 2025 - Present",
              style: TextStyle(color: Colors.white70),
            ),
          ),
          ListTile(
            title: Text("WarmingUP", style: TextStyle(color: Colors.white)),
            subtitle: Text(
              "Mobile Developer – Internship",
              style: TextStyle(color: Colors.white70),
            ),
            trailing: Text(
              "Aug 2023 - Jul 2024",
              style: TextStyle(color: Colors.white70),
            ),
          ),
          ListTile(
            title: Text("Telkom University",
                style: TextStyle(color: Colors.white)),
            subtitle: Text(
              "Lab Assistant – Part time",
              style: TextStyle(color: Colors.white70),
            ),
            trailing: Text(
              "Aug 2023 - May 2024",
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}
