import 'package:flutter/material.dart';
import 'package:haidar_website/gen/assets.gen.dart';
import 'package:haidar_website/theme/colors.dart';

class HomeAvatarUi extends StatelessWidget {
  const HomeAvatarUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 6.6,
        right: 7.2,
        top: 4.2,
        bottom: 3.6,
      ),
      decoration: BoxDecoration(
        color: AppColors.textYellow,
        shape: BoxShape.circle,
      ),
      child: Assets.images.myAvatar.image(width: 40.2, height: 42),
    );
  }
}
