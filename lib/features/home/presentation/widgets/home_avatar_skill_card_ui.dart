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
        ],
      ),
    );
  }
}
