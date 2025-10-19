import 'dart:ui'; // Import ini untuk ImageFilter
import 'package:flutter/material.dart';
import 'package:haidar_website/gen/assets.gen.dart';
import 'package:haidar_website/theme/colors.dart';

class HomeAppBar extends StatelessWidget {
  final VoidCallback? onMenuPressed;
  final VoidCallback? onAvatarPressed;
  final bool isDarkMode;

  const HomeAppBar({
    super.key,
    this.onMenuPressed,
    this.onAvatarPressed,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = MediaQuery.of(context).size.width < 768;
        double screenWidth = MediaQuery.of(context).size.width;

        return Container(
          width: double.infinity,
          color: Colors.transparent,
          child: Align(
            alignment: isMobile ? Alignment.topCenter : Alignment.topRight,
            child: Container(
              width: isMobile ? screenWidth * 0.5 : 200,
              constraints: BoxConstraints(
                maxWidth: isMobile ? 200 : 300,
                minWidth: isMobile ? 150 : 200,
              ),
              margin: EdgeInsets.only(
                right: isMobile ? 0 : 259,
                top: 10,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(isMobile ? 20 : 25),
                  bottomLeft: Radius.circular(isMobile ? 20 : 25),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: isMobile ? 8 : 10,
                      horizontal: isMobile ? 15 : 25,
                    ),
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Colors.white.withValues(alpha: 0.1)
                          : Colors.black.withValues(alpha: 0.1),
                      border: Border.all(
                        color: isDarkMode
                            ? Colors.white.withValues(alpha: 0.2)
                            : Colors.black.withValues(alpha: 0.2),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(isMobile ? 20 : 25),
                        bottomLeft: Radius.circular(isMobile ? 20 : 25),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: onMenuPressed,
                            borderRadius: BorderRadius.circular(12),
                            child: Center(
                              child: Icon(
                                isDarkMode ? Icons.light_mode : Icons.dark_mode,
                                color: isDarkMode ? Colors.white : Colors.black,
                                size: isMobile ? 32 : 44,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: isMobile ? 20 : 57),
                        Expanded(
                          child: InkWell(
                            onTap: onAvatarPressed,
                            borderRadius: BorderRadius.circular(100),
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.all(isMobile ? 4 : 6),
                                decoration: BoxDecoration(
                                  color: AppColors.textYellow,
                                  shape: BoxShape.circle,
                                ),
                                child: Assets.images.myAvatar.image(
                                  width: isMobile ? 32 : 40.2,
                                  height: isMobile ? 34 : 42,
                                  fit: BoxFit.cover,
                                ),
                              ),
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
      },
    );
  }
}
