import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:haidar_website/core/routes/app_router.dart';
import 'package:haidar_website/gen/assets.gen.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  final Connectivity _connectivity = Connectivity();
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    _setupAnimation();
    _checkInternetConnection();
  }

  void _setupAnimation() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
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

    // Loop animasi sampai ada internet
    _controller.repeat();
  }

  void _checkInternetConnection() async {
    try {
      // Check koneksi pertama kali
      final result = await _connectivity.checkConnectivity();
      _handleConnectivityResult(result);

      _connectivity.onConnectivityChanged.listen((result) {
        _handleConnectivityResult(result);
      });
    } catch (e) {
      print('Error checking connectivity: $e');
    }
  }

  void _handleConnectivityResult(result) {
    final hasConnection = result != ConnectivityResult.none;

    if (hasConnection && !_isConnected) {
      _isConnected = true;
      _navigateToHome();
    } else if (!hasConnection && _isConnected) {
      _isConnected = false;
    }
  }

  void _navigateToHome() {
    if (mounted) {
      // Stop animasi loop
      _controller.stop();

      // Play animasi final sekali sebelum navigate
      _controller.forward().then((_) {
        if (mounted) {
          context.router.replace(const HomeRoute());
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = MediaQuery.of(context).size.width < 768;
        double screenWidth = MediaQuery.of(context).size.width;

        return Scaffold(
          backgroundColor: const Color(0xff161513),
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 24 : 48,
                ),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Animated avatar image
                          AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) {
                              return Assets.images.avatarSkill.image(
                                width: isMobile ? 80 : 100,
                                height: isMobile ? 80 : 100,
                              );
                            },
                          ),
                          SizedBox(height: isMobile ? 30 : 40),

                          // Main text "Haidar Website"
                          ShaderMask(
                            shaderCallback: (bounds) {
                              return LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.amber[300]!,
                                  Colors.amber[600]!,
                                ],
                              ).createShader(bounds);
                            },
                            child: Text(
                              'Haidar Website',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(
                                    fontSize:
                                        isMobile ? screenWidth * 0.08 : 56,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: isMobile ? 1.5 : 3.0,
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                          SizedBox(height: isMobile ? 16 : 20),

                          // Subtitle dengan animasi
                          AnimatedBuilder(
                            animation: _fadeAnimation,
                            builder: (context, child) {
                              return Opacity(
                                opacity: _fadeAnimation.value > 0.5
                                    ? (_fadeAnimation.value - 0.5) * 2
                                    : 0,
                                child: Text(
                                  'Connecting...',
                                  style: TextStyle(
                                    fontSize: isMobile ? 12 : 14,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: isMobile ? 1.5 : 2.0,
                                    color: Colors.white.withValues(alpha: 0.7),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: isMobile ? 30 : 40),

                          // Loading indicator
                          AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(3, (index) {
                                  final delay = index * 0.15;
                                  final animValue = (_controller.value - delay)
                                      .clamp(0.0, 1.0);
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: isMobile ? 3.0 : 4.0,
                                    ),
                                    child: Transform.translate(
                                      offset: Offset(
                                          0,
                                          -(isMobile ? 6 : 8) *
                                              (animValue > 0.5
                                                  ? 1 - animValue
                                                  : animValue) *
                                              2),
                                      child: Container(
                                        width: isMobile ? 5 : 6,
                                        height: isMobile ? 5 : 6,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.amber.withValues(
                                              alpha: 0.5 + animValue * 0.5),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                          SizedBox(height: isMobile ? 40 : 60),

                          // Status connection
                          AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) {
                              return Text(
                                _isConnected
                                    ? 'Ready!'
                                    : 'Waiting for connection...',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: isMobile ? 11 : 12,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: isMobile ? 0.8 : 1.0,
                                  color: _isConnected
                                      ? Colors.greenAccent
                                      : Colors.white.withValues(alpha: 0.5),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
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
