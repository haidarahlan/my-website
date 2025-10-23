import 'package:flutter/material.dart';
import 'package:haidar_website/gen/assets.gen.dart';
import 'package:haidar_website/theme/colors.dart';

class HomeCertificateCardUi extends StatelessWidget {
  const HomeCertificateCardUi({super.key});

  void _showImageDialog(BuildContext context, AssetGenImage image) {
    bool isMobile = MediaQuery.of(context).size.width < 768;

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: isMobile ? MediaQuery.of(context).size.width * 0.9 : 800,
            maxHeight:
                isMobile ? MediaQuery.of(context).size.height * 0.7 : 600,
          ),
          child: Center(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(isMobile ? 8 : 12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(isMobile ? 8 : 12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.5),
                          blurRadius: 30,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: InteractiveViewer(
                      minScale: 0.5,
                      maxScale: 3.0,
                      child: image.image(fit: BoxFit.contain),
                    ),
                  ),
                ),
                Positioned(
                  top: isMobile ? 5 : 10,
                  right: isMobile ? 5 : 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: isMobile ? 20 : 24,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = MediaQuery.of(context).size.width < 768;

        final certImages = [
          Assets.images.certification2,
          Assets.images.certification3,
          Assets.images.certification4,
          Assets.images.certification5,
        ];

        return Container(
          height: isMobile ? null : 500,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(isMobile ? 20 : 24),
            gradient: const LinearGradient(
              colors: [Color(0xFF202030), Color(0xFF5C41C8)],
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
                  "Certificates",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isMobile ? 20 : 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              LayoutBuilder(
                builder: (context, gridConstraints) {
                  int crossAxisCount =
                      isMobile ? 1 : (gridConstraints.maxWidth / 267).floor();
                  if (crossAxisCount < 1) crossAxisCount = 1;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(isMobile ? 16 : 12),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: isMobile ? 267 / 131 : 267 / 131,
                      crossAxisSpacing: isMobile ? 12 : 16,
                      mainAxisSpacing: isMobile ? 12 : 16,
                    ),
                    itemCount: certImages.length,
                    itemBuilder: (context, index) {
                      return _CertificateCard(
                        image: certImages[index],
                        onTap: () =>
                            _showImageDialog(context, certImages[index]),
                        isMobile: isMobile,
                      );
                    },
                  );
                },
              ),
              SizedBox(height: isMobile ? 8 : 12),
            ],
          ),
        );
      },
    );
  }
}

class _CertificateCard extends StatefulWidget {
  final AssetGenImage image;
  final VoidCallback onTap;
  final bool isMobile;

  const _CertificateCard({
    required this.image,
    required this.onTap,
    required this.isMobile,
  });

  @override
  State<_CertificateCard> createState() => _CertificateCardState();
}

class _CertificateCardState extends State<_CertificateCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedScale(
        scale: _isHovered && !widget.isMobile ? 1.03 : 1.0,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.isMobile ? 6 : 8),
            border: Border.all(
              color: _isHovered && !widget.isMobile
                  ? Colors.white.withValues(alpha: 0.3)
                  : Colors.white.withValues(alpha: 0.1),
              width: _isHovered && !widget.isMobile ? 2 : 1,
            ),
            boxShadow: _isHovered && !widget.isMobile
                ? [
                    BoxShadow(
                      color: AppColors.secondary.withValues(alpha: 0.4),
                      blurRadius: 16,
                      offset: Offset(0, 8),
                      spreadRadius: 2,
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.isMobile ? 6 : 8),
            child: InkWell(
              onTap: widget.onTap,
              child: widget.image.image(
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
