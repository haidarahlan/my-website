import 'package:flutter/material.dart';

class HomeResponsiveCard extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  
  const HomeResponsiveCard({
    super.key,
    required this.child,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 768;
        
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(isMobile ? 16 : 24),
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.transparent,
            borderRadius: borderRadius ?? BorderRadius.circular(isMobile ? 16 : 20),
            // Tambahkan shadow atau border sesuai kebutuhan
          ),
          child: child,
        );
      },
    );
  }
}