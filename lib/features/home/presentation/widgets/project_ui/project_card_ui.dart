import 'package:flutter/material.dart';
import 'package:haidar_website/theme/colors.dart';
import 'package:haidar_website/theme/text_style.dart';

class ProjectCardUi extends StatelessWidget {
  final String? title;
  final Widget? image;
  final VoidCallback onTap;

  const ProjectCardUi({
    super.key,
    this.title,
    this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.textBlack.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: image ?? SizedBox.shrink()),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 91),
            child: Text(
              title ?? "",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: primaryTextStyle.copyWith(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
