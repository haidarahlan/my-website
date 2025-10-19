import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:haidar_website/gen/assets.gen.dart';

class HomeAvatarSkillCardUi extends StatelessWidget {
  const HomeAvatarSkillCardUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = MediaQuery.of(context).size.width < 768;

        return Container(
          height: isMobile ? 380 : 434,
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
                  width: isMobile ? 120 : 161,
                  height: isMobile ? 180 : 234,
                  fit: BoxFit.contain,
                ),
              ),

              // Title "Skills" di atas
              Positioned(
                top: isMobile ? 16 : 24,
                left: isMobile ? 16 : 24,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildGlassTag("Frontend Development", isMobile),
                        _buildGlassTag("Git", isMobile),
                        _buildGlassTag("REST API", isMobile),
                      ],
                    ),
                  ],
                ),
              ),

              // Flutter Logo - kiri bawah
              Positioned(
                left: isMobile ? 50 : 20,
                bottom: isMobile ? 16 : 20,
                child: _buildSkillIcon(
                  child: FlutterLogo(size: isMobile ? 24 : 30),
                  isMobile: isMobile,
                ),
              ),

              // Dart Logo - kiri tengah bawah
              Positioned(
                left: isMobile ? 50 : 20,
                bottom: isMobile ? 72 : 80,
                child: _buildSkillIcon(
                  child: Assets.icons.logo.dart.svg(
                    width: isMobile ? 24 : 30,
                    height: isMobile ? 24 : 30,
                    fit: BoxFit.cover,
                  ),
                  isMobile: isMobile,
                ),
              ),

              // Firebase Logo - kiri tengah atas
              Positioned(
                left: isMobile ? 50 : 20,
                bottom: isMobile ? 128 : 140,
                child: _buildSkillIcon(
                  child: Assets.icons.logo.firebase.svg(
                    width: isMobile ? 24 : 30,
                    height: isMobile ? 24 : 30,
                    fit: BoxFit.cover,
                  ),
                  isMobile: isMobile,
                ),
              ),

              // Laravel Logo - kanan tengah atas
              Positioned(
                right: isMobile ? 50 : 20,
                bottom: isMobile ? 128 : 140,
                child: _buildSkillIcon(
                  child: Assets.icons.logo.laravel.svg(
                    width: isMobile ? 24 : 30,
                    height: isMobile ? 24 : 30,
                    fit: BoxFit.cover,
                  ),
                  isMobile: isMobile,
                ),
              ),

              // PHP Logo - kanan tengah bawah
              Positioned(
                right: isMobile ? 50 : 20,
                bottom: isMobile ? 72 : 80,
                child: _buildSkillIcon(
                  child: Assets.icons.logo.php.svg(
                    width: isMobile ? 24 : 30,
                    height: isMobile ? 24 : 30,
                    fit: BoxFit.cover,
                  ),
                  isMobile: isMobile,
                ),
              ),

              // JavaScript Logo - kanan bawah
              Positioned(
                right: isMobile ? 50 : 20,
                bottom: isMobile ? 16 : 20,
                child: _buildSkillIcon(
                  child: Assets.icons.logo.javascript.svg(
                    width: isMobile ? 24 : 30,
                    height: isMobile ? 24 : 30,
                    fit: BoxFit.cover,
                  ),
                  isMobile: isMobile,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGlassTag(String text, bool isMobile) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 12 : 16,
            vertical: isMobile ? 6 : 8,
          ),
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
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 12 : 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkillIcon({required Widget child, required bool isMobile}) {
    return Container(
      width: isMobile ? 48 : 56,
      height: isMobile ? 48 : 56,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(isMobile ? 12 : 16),
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
