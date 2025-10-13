import 'dart:ui'; // Import ini untuk ImageFilter
import 'package:flutter/material.dart';
import 'package:haidar_website/gen/assets.gen.dart';
import 'package:haidar_website/theme/colors.dart';

class HomeAppBar extends StatelessWidget {
  final VoidCallback? onMenuPressed;
  final VoidCallback? onAvatarPressed;

  const HomeAppBar({
    super.key,
    this.onMenuPressed,
    this.onAvatarPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          width: 200,
          constraints: BoxConstraints(maxWidth: 300),
          margin: EdgeInsets.only(right: 259, top: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.2),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: onMenuPressed,
                        child: Assets.icons.menuBurger.svg(
                          width: 44,
                        ),
                      ),
                    ),
                    const SizedBox(width: 57),
                    Expanded(
                      child: InkWell(
                        onTap: onAvatarPressed,
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
                          child: Assets.images.myAvatar
                              .image(width: 40.2, height: 42),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
