import 'package:flutter/material.dart';
import 'package:haidar_website/features/home/presentation/widgets/project_ui/project_card_ui.dart';
import 'package:haidar_website/gen/assets.gen.dart';
import 'package:haidar_website/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeProjectCardUi extends StatelessWidget {
  const HomeProjectCardUi({
    super.key,
  });

  // method membuka URL
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
          width: double.infinity,
          height: isMobile ? null : 450,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(isMobile ? 20 : 24),
            gradient: const LinearGradient(
              colors: [Color(0xFF894EFF), Color(0xFFDE67D4)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
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
                  "Projects",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isMobile ? 20 : 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: isMobile ? 8 : 12),
              Padding(
                padding: EdgeInsets.all(isMobile ? 16 : 30),
                child: Center(
                  child: Wrap(
                    spacing: isMobile ? 12 : 20,
                    runSpacing: isMobile ? 12 : 20,
                    children: [
                      ProjectCardUi(
                        title: "Smart Mind Center App",
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Assets.images.appSmartmind.image(
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () => _launchURL(
                            'https://play.google.com/store/apps/details?id=com.saga.smartmind&hl=id'),
                      ),
                      ProjectCardUi(
                        title: "Stevor Express",
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Assets.images.appStevor.image(
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () => _launchURL(
                            'https://play.google.com/store/apps/details?id=com.stevor.express&hl=id'),
                      ),
                      ProjectCardUi(
                        title: "Stevor Driver",
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Assets.images.appDriver.image(
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () => _launchURL(
                            'https://play.google.com/store/apps/details?id=com.stevor.driver&hl=id'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}