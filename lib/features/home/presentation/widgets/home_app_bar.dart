import 'package:flutter/material.dart';
import 'package:haidar_website/gen/assets.gen.dart';
import 'package:haidar_website/theme/colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      constraints: BoxConstraints(maxWidth: 300),
      margin: EdgeInsets.only(right: 259),
      padding: EdgeInsets.symmetric(vertical: 22, horizontal: 23),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.5),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Assets.icons.menuBurger.svg(
              width: 44,
            ),
          ),
          const SizedBox(width: 57),
          Expanded(
            child: Container(
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
            ),
          )
        ],
      ),
    );
  }
}
