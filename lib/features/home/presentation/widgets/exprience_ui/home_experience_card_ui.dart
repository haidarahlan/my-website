import 'package:flutter/material.dart';
import 'package:haidar_website/features/home/presentation/model/experience_model.dart';
import 'package:haidar_website/gen/assets.gen.dart';
import 'package:haidar_website/theme/colors.dart';
import 'package:haidar_website/theme/text_style.dart';

class HomeExperienceCardUi extends StatelessWidget {
  const HomeExperienceCardUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = MediaQuery.of(context).size.width < 768;

        List<ExperienceModel> experiencesList = [
          ExperienceModel(
              company: "Flutter Developer at Stevor Express",
              position: "contract",
              period: "Jan 2025 - Present",
              description:
                  "Handled iOS deployment process including building, signing, and uploading the app to AppStore Connect, ensuring proper compliance and publication standards.",
              companyLogo: Assets.images.logoStevor.image(
                width: isMobile ? 30 : 35,
                height: isMobile ? 30 : 35,
                fit: BoxFit.cover,
              )),
          ExperienceModel(
              company: "Mobile Developer at WarminUP",
              position: "Internship",
              period: "Jun 2023 - Jul 2024",
              description:
                  "Developed the Ngolab mobile application and maintained the WarminUP landing page website, ensuring stable functionality and continuous improvements.",
              companyLogo: Assets.images.logoWarmingup.image(
                width: isMobile ? 30 : 35,
                height: isMobile ? 30 : 35,
                fit: BoxFit.cover,
              )),
          ExperienceModel(
              company: "Practicum Asistant at Telkom University",
              position: "Part Time",
              period: "Sep 2023 - Jan 2024",
              description:
                  "Acted as a Teaching Assistant for Basic Software Engineering Material Training at the First Expert Diplomatic Information Education and Training Center, Ministry of Foreign Affairs. This role involved preparing training materials and grading student assignments for participants in the Formation of Functional Positions program.",
              companyLogo: Assets.images.logoTelkom.image(
                width: isMobile ? 30 : 35,
                height: isMobile ? 30 : 35,
                fit: BoxFit.cover,
              )),
        ];

        return Container(
          height: isMobile ? null : 450,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(isMobile ? 20 : 24),
            gradient: const LinearGradient(
              colors: [Color(0xFF202030), Color(0xFF5C41C8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 84,
                  vertical: isMobile ? 12 : 16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.textBlack.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(isMobile ? 20 : 24),
                    topRight: Radius.circular(isMobile ? 20 : 24),
                  ),
                ),
                child: Text(
                  "Experience",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isMobile ? 20 : 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: isMobile ? 8 : 12),

              // List Experience
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: experiencesList.length,
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 16 : 30,
                ),
                itemBuilder: (context, index) {
                  final exp = experiencesList[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: isMobile ? 12 : 15,
                    ),
                    child: isMobile
                        ? _buildMobileExperienceItem(exp)
                        : _buildDesktopExperienceItem(exp),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Layout untuk Mobile
  Widget _buildMobileExperienceItem(ExperienceModel exp) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: exp.companyLogo,
            ),
            const SizedBox(width: 12),

            // Company Name & Position
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exp.company,
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        exp.position,
                        style: primaryTextStyle.copyWith(
                          fontSize: 10,
                          color: AppColors.grey2,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "• ${exp.period}",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Description
        Padding(
          padding: const EdgeInsets.only(left: 42),
          child: Text(
            exp.description ?? '',
            style: primaryTextStyle.copyWith(
              fontSize: 10,
              color: AppColors.grey2,
              height: 1.4,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  // Layout untuk Desktop
  Widget _buildDesktopExperienceItem(ExperienceModel exp) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: exp.companyLogo,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company Name
              Text(
                exp.company,
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 10),

              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 450),
                child: Text(
                  exp.description ?? '',
                  style: primaryTextStyle.copyWith(
                    fontSize: 10,
                    color: AppColors.grey2,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              exp.position,
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                color: AppColors.grey2,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              exp.period,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
