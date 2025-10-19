import 'package:flutter/material.dart';
import 'package:haidar_website/features/home/presentation/widgets/avatar_ui/home_avatar_ui.dart';
import 'package:haidar_website/features/home/presentation/widgets/home_responsive_card.dart';
import 'package:haidar_website/features/home/presentation/widgets/profile_description/profile_card_sosmed_ui.dart';
import 'package:haidar_website/gen/assets.gen.dart';
import 'package:haidar_website/theme/colors.dart';
import 'package:haidar_website/theme/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeProfileDescriptionCardUi extends StatelessWidget {
  const HomeProfileDescriptionCardUi({super.key});

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = MediaQuery.of(context).size.width < 768;

        return HomeResponsiveCard(
          backgroundColor: const Color(0xff8B4513),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary,
              AppColors.secondary,
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // avatar profile
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeAvatarUi(),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, Im Haidar',
                          softWrap: true,
                          maxLines: 1,
                          style: primaryTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: isMobile ? 15 : 20,
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                          ),
                        ),
                        Text('Mobile Developer & Security Enthusiast',
                            softWrap: true,
                            maxLines: 1,
                            style: primaryTextStyle.copyWith(
                              color: AppColors.grey2,
                              fontSize: isMobile ? 10 : 15,
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                            )),
                      ],
                    ),
                  ),
                  ProfileCardSosmedUi(
                    onTap: () => _launchURL(
                        'https://www.linkedin.com/in/haidar-ahlan-ghaffar/'),
                    iconSosmed: Assets.icons.logo.linkedinnew
                        .svg(width: 24, height: 24, fit: BoxFit.cover),
                  ),
                  SizedBox(width: 7),
                  ProfileCardSosmedUi(
                    onTap: () => _launchURL(
                        'https://github.com/haidarahlan?tab=overview&from=2025-10-01&to=2025-10-16'),
                    iconSosmed: Assets.icons.logo.github
                        .svg(width: 24, height: 24, fit: BoxFit.cover),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'I do code and\nbuild apps for it',
                style: primaryTextStyle.copyWith(
                  color: Colors.white,
                  fontSize: isMobile ? 24 : 53,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              SizedBox(height: isMobile ? 12 : 16),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: isMobile ? 456 : 565),
                child: Text(
                  "I'm a Mobile Developer with 2 years of experience creating Flutter apps. I specialize in frontend development and Bloc state management, building scalable solutions with attention to both user experience and code quality.",
                  style: primaryTextStyle.copyWith(
                    color: AppColors.grey3,
                    fontSize: isMobile ? 14 : 16,
                    height: 1.5,
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(height: isMobile ? 16 : 24),
            ],
          ),
        );
      },
    );
  }
}
