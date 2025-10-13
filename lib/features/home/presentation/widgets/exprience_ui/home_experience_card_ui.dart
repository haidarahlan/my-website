import 'package:flutter/material.dart';
import 'package:haidar_website/features/home/presentation/model/experience_model.dart';
import 'package:haidar_website/gen/assets.gen.dart';
import 'package:haidar_website/theme/colors.dart';
import 'package:haidar_website/theme/text_style.dart';

class HomeExperienceCardUi extends StatelessWidget {
  final bool isMobile;

  const HomeExperienceCardUi({
    super.key,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    List<ExperienceModel> experiencesList = [
      ExperienceModel(
          company: "Flutter Developer at Stevor Express",
          position: "contract",
          period: "Jan 2025 - Present",
          description:
              "Handled iOS deployment process including building, signing, and uploading the app to AppStore Connect, ensuring proper compliance and publication standards.",
          companyLogo: Assets.images.logoStevor.image(
            width: 35,
            height: 35,
            fit: BoxFit.cover,
          )),
      ExperienceModel(
          company: "Mobile Developer at WarminUP",
          position: "Internship",
          period: "Jun 2023 - Jul 2024",
          description:
              "Developed the Ngolab mobile application and maintained the WarminUP landing page website, ensuring stable functionality and continuous improvements.",
          companyLogo: Assets.images.logoWarmingup.image(
            width: 35,
            height: 35,
            fit: BoxFit.cover,
          )),
      ExperienceModel(
          company: "Practicum Asistant at Telkom University",
          position: "Part Time",
          period: "Sep 2023 - Jan 2024",
          description:
              "Acted as a Teaching Assistant for Basic Software Engineering Material Training at the First Expert Diplomatic Information Education and Training Center, Ministry of Foreign Affairs. This role involved preparing training materials and grading student assignments for participants in the Formation of Functional Positions program.",
          companyLogo: Assets.images.logoTelkom.image(
            width: 35,
            height: 35,
            fit: BoxFit.cover,
          )),
    ];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFF202030), Color(0xFF5C41C8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 84, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.textBlack.withValues(alpha: 0.3),
            ),
            child: Text(
              "Experience",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          SizedBox(height: 12),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: experiencesList.length,
            padding: EdgeInsets.symmetric(horizontal: 30),
            itemBuilder: (context, index) {
              final exp = experiencesList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo/Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: exp.companyLogo,
                    ),
                    const SizedBox(width: 15),

                    // Content (Company, Description)
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

                          // Description
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

                    // Position & Period
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
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
