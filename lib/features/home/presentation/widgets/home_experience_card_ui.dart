import 'package:flutter/material.dart';
import 'package:haidar_website/features/home/presentation/model/experience_model.dart';
import 'package:haidar_website/theme/colors.dart';

class HomeExperienceCardUi extends StatelessWidget {
  const HomeExperienceCardUi({super.key});

  @override
  Widget build(BuildContext context) {
    List<ExperienceModel> experiencesList = [
      ExperienceModel(
        company: "Stevor Express",
        position: "Flutter Developer - contract",
        period: "Jan 2025 - Present",
      ),
      ExperienceModel(
        company: "WarminUP",
        position: "Mobile Developer - Internship",
        period: "Jun 2023 - Jul 2024",
      ),
      ExperienceModel(
        company: "Telkom University",
        position: "Asisten Praktikum",
        period: "Sep 2023 - Jan 2024",
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFF3F2B96), Color(0xFFA8C0FF)],
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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            itemBuilder: (context, index) {
              final exp = experiencesList[index];
              return ListTile(
                title: Text(
                  exp.company,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  exp.position,
                  style: const TextStyle(color: Colors.white70),
                ),
                trailing: Text(
                  exp.period,
                  style: const TextStyle(color: Colors.white70),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
