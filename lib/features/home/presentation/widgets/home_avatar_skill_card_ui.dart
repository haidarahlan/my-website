import 'package:flutter/material.dart';
import 'package:haidar_website/gen/assets.gen.dart';
import 'package:haidar_website/theme/text_style.dart';

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
          // Avatar di bagian bawah
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Assets.images.avatarSkill.image(
              width: 161,
              height: 234,
              fit: BoxFit.contain,
            ),
          ),

          // Title "Skills" di atas
          Positioned(
            top: 24,
            left: 24,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Skills",
                  style: primaryTextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
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

          // Flutter Logo - kiri atas
          Positioned(
            left: 20,
            bottom: 20,
            child: _buildSkillIcon(child: FlutterLogo(size: 30)),
          ),

          // Dart Logo - kanan atas
          Positioned(
            left: 20,
            bottom: 80,
            child: _buildSkillIcon(
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Center(
                  child: Text(
                    'D',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Firebase Logo - kanan tengah
          Positioned(
            left: 20,
            bottom: 140,
            child: _buildSkillIcon(
              child: Icon(
                Icons.whatshot,
                color: Colors.orange,
                size: 24,
              ),
            ),
          ),

          // Git Logo - kiri tengah
          Positioned(
            right: 20,
            bottom: 140,
            child: _buildSkillIcon(
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.orange[800],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.merge_type,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),

          // API Logo - kanan bawah
          Positioned(
            right: 20,
            bottom: 80,
            child: _buildSkillIcon(
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.green[600],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Center(
                  child: Text(
                    'API',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 8,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Testing Logo - kiri bawah
          Positioned(
            right: 20,
            bottom: 20,
            child: _buildSkillIcon(
              child: Icon(
                Icons.bug_report,
                color: Colors.purple,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillIcon({required Widget child}) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(child: child),
    );
  }
}
