import 'package:flutter/material.dart';
import 'package:haidar_website/features/home/presentation/widgets/home_responsive_card.dart';

class HomeProfileDescriptionCardUi extends StatelessWidget {
  const HomeProfileDescriptionCardUi({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = MediaQuery.of(context).size.width < 768;

        return HomeResponsiveCard(
          backgroundColor: const Color(0xff8B4513),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Passionate to pursue\nthe technology.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 24 : 32,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              SizedBox(height: isMobile ? 12 : 16),
              Text(
                'Hello! I\'m Haidar, a passionate Flutter developer with expertise in mobile app development. I love creating beautiful and functional applications.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: isMobile ? 14 : 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: isMobile ? 16 : 24),
              // Add buttons or other content here
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 16 : 24,
                        vertical: isMobile ? 8 : 12,
                      ),
                    ),
                    child: Text(
                      'Contact Me',
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 16,
                      ),
                    ),
                  ),
                  SizedBox(width: isMobile ? 8 : 12),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View Portfolio',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isMobile ? 14 : 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
