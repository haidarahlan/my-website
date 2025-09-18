import 'package:flutter/material.dart';
import 'package:haidar_website/gen/assets.gen.dart';
import 'package:haidar_website/theme/colors.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final double radius;
  final double? height;
  final double? width;
  final bool isIcon;
  final SvgGenImage? icon;
  final bool isTwoButton;
  final Color? color;
  final Color? colorTitle;
  final double? fontSize;
  final double iconSize;
  final FontWeight? fontWeight;
  final double? elevation;
  final BorderSide? side;
  final bool isLoading;
  final bool isDisabled;

  const AppButton({
    super.key,
    required this.title,
    this.onPressed,
    this.height,
    this.width,
    this.isTwoButton = false,
    this.fontSize,
    this.fontWeight,
    this.elevation,
    this.side,
    this.color,
    this.colorTitle,
    this.isIcon = false,
    this.icon,
    this.radius = 8,
    this.iconSize = 14,
    this.isLoading = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height ?? 56,
      minWidth: width ?? double.infinity,
      color: isDisabled ? AppColors.grey2 : color ?? AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: side ?? BorderSide.none,
      ),
      onPressed: isDisabled ? null : onPressed,
      disabledColor: AppColors.grey2,
      elevation: elevation,
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isIcon)
                  icon!.svg(
                    width: iconSize,
                    height: iconSize,
                    colorFilter: ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                SizedBox(width: 4),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Text(
                    title,
                    softWrap: true,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: fontSize ?? 14,
                      fontWeight: fontWeight ?? FontWeight.bold,
                      color: colorTitle ?? AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
