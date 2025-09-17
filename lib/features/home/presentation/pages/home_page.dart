import 'package:flutter/material.dart';
import 'package:haidar_website/features/home/presentation/widgets/home_app_bar.dart';
import 'package:haidar_website/features/home/presentation/widgets/home_avatar_skill_card_ui.dart';
import 'package:haidar_website/features/home/presentation/widgets/home_experience_card_ui.dart';
import 'package:haidar_website/features/home/presentation/widgets/home_profile_description_card_ui.dart';
import 'package:haidar_website/features/home/presentation/widgets/home_project_card_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff161513),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          // Determine if it's mobile, tablet, or desktop
          bool isMobile = constraints.maxWidth < 768;
          bool isTablet =
              constraints.maxWidth >= 768 && constraints.maxWidth < 1200;
          bool isDesktop = constraints.maxWidth >= 1200;

          return SingleChildScrollView(
            child: Column(
              children: [
                // AppBar
                HomeAppBar(),

                // Main Content - Centered
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    top: isMobile ? 80 : 141,
                  ),
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        maxWidth: _getMaxWidth(isMobile, isTablet, isDesktop),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: _getHorizontalPadding(isMobile, isTablet),
                      ),
                      child: _buildResponsiveLayout(isMobile, isTablet),
                    ),
                  ),
                ),

                // Bottom spacing
                SizedBox(height: isMobile ? 40 : 80),
              ],
            ),
          );
        }),
      ),
    );
  }

  double _getMaxWidth(bool isMobile, bool isTablet, bool isDesktop) {
    if (isMobile) return double.infinity;
    if (isTablet) return 1000;
    return 1400; // Desktop max width
  }

  double _getHorizontalPadding(bool isMobile, bool isTablet) {
    if (isMobile) return 20;
    if (isTablet) return 40;
    return 60; // Reduced padding for desktop since we're using maxWidth
  }

  Widget _buildResponsiveLayout(bool isMobile, bool isTablet) {
    if (isMobile) {
      return _buildMobileLayout();
    } else if (isTablet) {
      return _buildTabletLayout();
    } else {
      return _buildDesktopLayout();
    }
  }

  // Mobile Layout - Stack vertically
  Widget _buildMobileLayout() {
    return Column(
      children: [
        // Profile & Description Card
        HomeProfileDescriptionCardUi(),
        const SizedBox(height: 20),

        // Flutter Avatar
        HomeAvatarSkillCardUi(),
        const SizedBox(height: 20),

        // Projects Section
        HomeProjectCardUi(),
        const SizedBox(height: 20),

        // Experience Section
        HomeExperienceCardUi(),
      ],
    );
  }

  // Tablet Layout - Mixed arrangement
  Widget _buildTabletLayout() {
    return Column(
      children: [
        // Top section - Profile and Avatar side by side
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile & Description Card
            Expanded(
              flex: 2,
              child: HomeProfileDescriptionCardUi(),
            ),
            const SizedBox(width: 24),

            // Flutter Avatar
            Expanded(
              flex: 1,
              child: HomeAvatarSkillCardUi(),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Bottom section - Projects and Experience stacked
        HomeProjectCardUi(),
        const SizedBox(height: 20),
        HomeExperienceCardUi(),
      ],
    );
  }

  // Desktop Layout - Original 2x2 grid
  Widget _buildDesktopLayout() {
    return Column(
      children: [
        // Top section
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile & Description Card
            Expanded(
              flex: 3,
              child: HomeProfileDescriptionCardUi(),
            ),
            const SizedBox(width: 44),

            // Flutter Avatar
            Expanded(
              flex: 1,
              child: HomeAvatarSkillCardUi(),
            ),
          ],
        ),
        const SizedBox(height: 30),

        // Bottom section
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Projects Section
            Expanded(
              child: HomeProjectCardUi(),
            ),
            const SizedBox(width: 44),

            // Experience Section
            Expanded(
              child: HomeExperienceCardUi(),
            ),
          ],
        ),
      ],
    );
  }
}
