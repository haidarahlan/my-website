import 'package:flutter/material.dart';
import 'package:haidar_website/theme/colors.dart';

class ProfileCardSosmedUi extends StatelessWidget {
  final VoidCallback onTap;
  final Widget iconSosmed;

  const ProfileCardSosmedUi(
      {super.key, required this.onTap, required this.iconSosmed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColors.blackCard,
        ),
        child: iconSosmed,
      ),
    );
  }
}
