import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haidar_website/gen/assets.gen.dart';
import 'package:haidar_website/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeContactCardUi extends StatelessWidget {
  final bool isMobile;
  const HomeContactCardUi({super.key, this.isMobile = false});

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMobile ? null : 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.secondary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 84, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.textBlack.withValues(alpha: 0.3),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Text(
                "Contact Me",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Email Section
                  _ContactInfoItem(
                    icon: Icons.email_rounded,
                    title: "Email",
                    content: "ahlangaffar@gmail.com",
                    isEmail: true,
                    onEmailTap: () {
                      Clipboard.setData(
                        ClipboardData(text: "ahlangaffar@gmail.com"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Email Berhasil di copy"),
                          duration: Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    onTap: () => _launchURL('mailto:ahlangaffar@gmail.com'),
                  ),
                  SizedBox(height: 20),

                  // Location Section
                  _ContactInfoItem(
                    icon: Icons.music_note,
                    title: "Favorite Music",
                    content: "Abadi - Perunggu",
                  ),
                  SizedBox(height: 32),

                  Text(
                    "Connect with me",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16),

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.start,
                    children: [
                      _SocialMediaButton(
                        iconWidget: Assets.icons.logo.github.svg(width: 24),
                        label: "GitHub",
                        onTap: () => _launchURL(
                            'https://github.com/haidarahlan?tab=overview&from=2025-10-01&to=2025-10-16'),
                      ),
                      _SocialMediaButton(
                        iconWidget:
                            Assets.icons.logo.linkedinnew.svg(width: 24),
                        label: "LinkedIn",
                        onTap: () => _launchURL(
                            'https://www.linkedin.com/in/haidar-ahlan-ghaffar/'),
                      ),
                      _SocialMediaButton(
                        iconWidget: Assets.icons.logo.instagram.svg(width: 24),
                        label: "Instagram",
                        onTap: () => _launchURL(
                            'https://www.instagram.com/haidarahlanz/'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactInfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final bool isEmail;
  final VoidCallback? onTap;
  final VoidCallback? onEmailTap;

  const _ContactInfoItem({
    required this.icon,
    required this.title,
    required this.content,
    this.onTap,
    this.onEmailTap,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF8B5CF6),
                    Color(0xFFEC4899),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    content,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            if (isEmail)
              InkWell(
                onTap: onEmailTap,
                child: Icon(
                  Icons.content_copy_rounded,
                  color: Colors.white54,
                  size: 20,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _SocialMediaButton extends StatefulWidget {
  final Widget iconWidget;
  final String label;
  final VoidCallback onTap;

  const _SocialMediaButton({
    required this.iconWidget,
    required this.label,
    required this.onTap,
  });

  @override
  State<_SocialMediaButton> createState() => _SocialMediaButtonState();
}

class _SocialMediaButtonState extends State<_SocialMediaButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          decoration: BoxDecoration(
            gradient: isHovered
                ? LinearGradient(
                    colors: [Color(0xFF8B5CF6), Color(0xFFEC4899)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.iconWidget,
              SizedBox(width: 8),
              Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
