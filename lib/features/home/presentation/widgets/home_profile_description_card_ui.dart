import 'package:flutter/material.dart';
import 'package:haidar_website/features/home/presentation/widgets/home_avatar_ui.dart';
import 'package:haidar_website/features/home/presentation/widgets/home_responsive_card.dart';
import 'package:haidar_website/features/home/presentation/widgets/profile_description/profile_card_sosmed_ui.dart';
import 'package:haidar_website/gen/assets.gen.dart';
import 'package:haidar_website/theme/colors.dart';
import 'package:haidar_website/widget/app_button.dart';

class HomeProfileDescriptionCardUi extends StatelessWidget {
  const HomeProfileDescriptionCardUi({super.key});

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
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isMobile ? 15 : 20,
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                          ),
                        ),
                        Text(
                          'Mobile Developer',
                          softWrap: true,
                          maxLines: 1,
                          style: TextStyle(
                            color: AppColors.grey2,
                            fontSize: isMobile ? 10 : 15,
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ProfileCardSosmedUi(
                    onTap: () {},
                    iconSosmed: Assets.icons.logo.linkedinnew
                        .svg(width: 24, height: 24, fit: BoxFit.cover),
                  ),
                  SizedBox(width: 7),
                  ProfileCardSosmedUi(
                    onTap: () {},
                    iconSosmed: Assets.icons.logo.github
                        .svg(width: 24, height: 24, fit: BoxFit.cover),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'I do code and\nbuild apps for it',
                style: TextStyle(
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
                  'I am a seasoned Mobile Developer with over 2 years of professional experience, specializing in front-end developmnet. My expertise lies in crafting mobile UI and scalable state management blocand firebase for backend as a service.',
                  style: TextStyle(
                    color: AppColors.grey3,
                    fontSize: isMobile ? 14 : 16,
                    height: 1.5,
                  ),
                ),
              ),
              SizedBox(height: isMobile ? 16 : 24),
              // Add buttons or other content here
              Row(
                children: [
                  AppButton(
                    title: 'My Resume',
                    height: 40,
                    width: 200,
                    elevation: 3,
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(width: isMobile ? 8 : 12),
            ],
          ),
        );
      },
    );
  }
}
