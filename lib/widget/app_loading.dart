import 'package:flutter/material.dart';
import 'package:haidar_website/gen/assets.gen.dart';

class AppLoading extends StatefulWidget {
  final String title;
  final String subtitle;
  final String conectionTitle;
  final Duration duration;
  final Color primaryColor;
  final Color secondaryColor;

  const AppLoading({
    super.key,
    this.title = 'Haidar Website',
    this.subtitle = 'Loading...',
    this.conectionTitle = 'waiting for connection...',
    this.duration = const Duration(milliseconds: 2500),
    this.primaryColor = Colors.amber,
    this.secondaryColor = Colors.amber,
  });

  @override
  State<AppLoading> createState() => _AppLoadingState();
}

class _AppLoadingState extends State<AppLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimation();
  }

  void _setupAnimation() {
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    // Fade in animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeInOutQuad),
      ),
    );

    // Slide up animation
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
      ),
    );

    // Scale animation
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
      ),
    );

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated avatar
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Assets.images.avatarSkill.image(
                      width: 100,
                      height: 100,
                    );
                  },
                ),
                const SizedBox(height: 40),
                // Main text dengan gradient
                ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        widget.primaryColor.withValues(alpha: 0.8),
                        widget.primaryColor.withValues(alpha: 1.0),
                      ],
                    ).createShader(bounds);
                  },
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 56,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3.0,
                          color: Colors.white,
                        ),
                  ),
                ),
                const SizedBox(height: 20),
                // Subtitle dengan animasi
                AnimatedBuilder(
                  animation: _fadeAnimation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _fadeAnimation.value > 0.5
                          ? (_fadeAnimation.value - 0.5) * 2
                          : 0,
                      child: Text(
                        widget.subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 2.0,
                          color: Colors.white.withValues(alpha: 0.7),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                // Loading indicator dengan 3 dots
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        final delay = index * 0.15;
                        final animValue =
                            (_controller.value - delay).clamp(0.0, 1.0);
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Transform.translate(
                            offset: Offset(
                                0,
                                -8 *
                                    (animValue > 0.5
                                        ? 1 - animValue
                                        : animValue) *
                                    2),
                            child: Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: widget.primaryColor
                                    .withValues(alpha: 0.5 + animValue * 0.5),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
                const SizedBox(height: 40),
                AnimatedBuilder(
                  animation: _fadeAnimation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _fadeAnimation.value > 0.5
                          ? (_fadeAnimation.value - 0.5) * 2
                          : 0,
                      child: Text(
                        widget.conectionTitle,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 2.0,
                          color: Colors.white.withValues(alpha: 0.7),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
