import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:haidar_website/gen/assets.gen.dart';

class HomeAvatarSkillCardUi extends StatelessWidget {
  final bool? isMobile;
  const HomeAvatarSkillCardUi({
    super.key,
    this.isMobile,
  });

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
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildGlassTag("Frontend Development"),
                    _buildGlassTag("Git"),
                    _buildGlassTag("REST API"),
                  ],
                ),
              ],
            ),
          ),

          // Flutter Logo - kiri atas
          Positioned(
            left: isMobile == true ? 100 : 20,
            bottom: 20,
            child: _buildSkillIcon(child: FlutterLogo(size: 30)),
          ),

          // Dart Logo - kanan atas
          Positioned(
            left: isMobile == true ? 100 : 20,
            bottom: 80,
            child: _buildSkillIcon(
              child: Assets.icons.logo.dart.svg(
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Firebase Logo - kanan tengah
          Positioned(
            left: isMobile == true ? 100 : 20,
            bottom: 140,
            child: _buildSkillIcon(
              child: Assets.icons.logo.firebase.svg(
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Git Logo - kiri tengah
          Positioned(
            right: isMobile == true ? 100 : 20,
            bottom: 140,
            child: _buildSkillIcon(
              child: Assets.icons.logo.laravel.svg(
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // API Logo - kanan bawah
          Positioned(
            right: isMobile == true ? 100 : 20,
            bottom: 80,
            child: _buildSkillIcon(
              child: Assets.icons.logo.php.svg(
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Testing Logo - kiri bawah
          Positioned(
            right: isMobile == true ? 100 : 20,
            bottom: 20,
            child: _buildSkillIcon(
              child: Assets.icons.logo.javascript.svg(
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassTag(String text) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.3,
            ),
          ),
        ),
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
