import 'package:flutter/material.dart';
import 'package:haidar_website/features/home/presentation/widgets/project_ui/project_card_ui.dart';
import 'package:haidar_website/gen/assets.gen.dart';
import 'package:haidar_website/theme/colors.dart';

class HomeProjectCardUi extends StatelessWidget {
  const HomeProjectCardUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFF894EFF), Color(0xFFDE67D4)],
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
              "Project",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Wrap(
              spacing: 19,
              runSpacing: 40,
              children: [
                ProjectCardUi(
                  title: "Noglab App",
                  image: Assets.images.myAvatar.image(
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                  onTap: () {},
                ),
                ProjectCardUi(
                  title: "Smart Mind Center App",
                  image: Assets.images.myAvatar.image(
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                  onTap: () {},
                ),
                ProjectCardUi(
                  title: "Stevor Express",
                  image: Assets.images.myAvatar.image(
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                  onTap: () {},
                ),
                ProjectCardUi(
                  title: "Website WarminUp",
                  image: Assets.images.myAvatar.image(
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
