import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haidar_website/gen/assets.gen.dart';
import 'package:haidar_website/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeContactCardUi extends StatelessWidget {
  const HomeContactCardUi({super.key});

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = MediaQuery.of(context).size.width < 768;

        return Container(
          height: isMobile ? null : 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(isMobile ? 20 : 24),
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
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 20 : 84,
                    vertical: isMobile ? 12 : 16,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.textBlack.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isMobile ? 20 : 24),
                      topRight: Radius.circular(isMobile ? 20 : 24),
                    ),
                  ),
                  child: Text(
                    "Contact Me",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 20 : 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(isMobile ? 16 : 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email Section
                      _ContactInfoItem(
                        icon: Icons.email_rounded,
                        title: "Email",
                        content: "ahlangaffar@gmail.com",
                        isEmail: true,
                        isMobile: isMobile,
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
                      SizedBox(height: isMobile ? 16 : 20),

                      // Favorite Music Section
                      _ContactInfoItem(
                        icon: Icons.music_note,
                        title: "Favorite Music",
                        content: "Abadi - Perunggu",
                        isMobile: isMobile,
                      ),
                      SizedBox(height: isMobile ? 24 : 32),

                      Text(
                        "Connect with me",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: isMobile ? 14 : 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: isMobile ? 12 : 16),

                      Wrap(
                        spacing: isMobile ? 8 : 10,
                        runSpacing: isMobile ? 8 : 10,
                        alignment: WrapAlignment.start,
                        children: [
                          _SocialMediaButton(
                            iconWidget: Assets.icons.logo.github.svg(
                              width: isMobile ? 20 : 24,
                            ),
                            label: "GitHub",
                            onTap: () => _launchURL(
                                'https://github.com/haidarahlan?tab=overview&from=2025-10-01&to=2025-10-16'),
                            isMobile: isMobile,
                          ),
                          _SocialMediaButton(
                            iconWidget: Assets.icons.logo.linkedinnew.svg(
                              width: isMobile ? 20 : 24,
                            ),
                            label: "LinkedIn",
                            onTap: () => _launchURL(
                                'https://www.linkedin.com/in/haidar-ahlan-ghaffar/'),
                            isMobile: isMobile,
                          ),
                          _SocialMediaButton(
                            iconWidget: Assets.icons.logo.instagram.svg(
                              width: isMobile ? 20 : 24,
                            ),
                            label: "Instagram",
                            onTap: () => _launchURL(
                                'https://www.instagram.com/haidarahlanz/'),
                            isMobile: isMobile,
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
      },
    );
  }
}

class _ContactInfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final bool isEmail;
  final bool isMobile;
  final VoidCallback? onTap;
  final VoidCallback? onEmailTap;

  const _ContactInfoItem({
    required this.icon,
    required this.title,
    required this.content,
    required this.isMobile,
    this.onTap,
    this.onEmailTap,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(isMobile ? 10 : 12),
      child: Container(
        padding: EdgeInsets.all(isMobile ? 12 : 16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(isMobile ? 10 : 12),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(isMobile ? 10 : 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF8B5CF6),
                    Color(0xFFEC4899),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(isMobile ? 8 : 10),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: isMobile ? 20 : 24,
              ),
            ),
            SizedBox(width: isMobile ? 12 : 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: isMobile ? 12 : 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    content,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 14 : 16,
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
                  size: isMobile ? 18 : 20,
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
  final bool isMobile;

  const _SocialMediaButton({
    required this.iconWidget,
    required this.label,
    required this.onTap,
    required this.isMobile,
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
          padding: EdgeInsets.symmetric(
            horizontal: widget.isMobile ? 8 : 10,
            vertical: widget.isMobile ? 10 : 12,
          ),
          decoration: BoxDecoration(
            gradient: isHovered && !widget.isMobile
                ? LinearGradient(
                    colors: [Color(0xFF8B5CF6), Color(0xFFEC4899)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(widget.isMobile ? 10 : 12),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.iconWidget,
              SizedBox(width: widget.isMobile ? 6 : 8),
              Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: widget.isMobile ? 12 : 14,
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