import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:haidar_website/features/home/presentation/widgets/home_app_bar.dart';
import 'package:haidar_website/features/home/presentation/widgets/avatar_ui/home_avatar_skill_card_ui.dart';
import 'package:haidar_website/features/home/presentation/widgets/certificate_ui/home_certificate_card_ui.dart';
import 'package:haidar_website/features/home/presentation/widgets/exprience_ui/home_experience_card_ui.dart';
import 'package:haidar_website/features/home/presentation/widgets/contact_ui/home_contact_card_ui.dart';
import 'package:haidar_website/features/home/presentation/widgets/profile_description/home_profile_description_card_ui.dart';
import 'package:haidar_website/features/home/presentation/widgets/project_ui/home_project_card_ui.dart';
import 'package:haidar_website/widget/app_loading.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  bool _isConnected = false;
  bool _isDarkMode = true;

  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
  }

  void _checkInternetConnection() async {
    try {
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

    if (mounted) {
      setState(() {
        _isConnected = hasConnection;
        _isLoading = !hasConnection;
      });
    }
  }

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? const Color(0xff161513) : Colors.white,
      body: SafeArea(
        child: _isLoading
            ? AppLoading(
                title: 'Haidar Website',
                subtitle: 'Loading...',
                conectionTitle:
                    _isConnected ? 'Ready' : 'Waiting for connection...',
              )
            : _buildMainContent(),
      ),
    );
  }

  Widget _buildMainContent() {
    return LayoutBuilder(builder: (context, constraints) {
      //lebar layout mobile, tablet, or desktop
      bool isMobile = constraints.maxWidth < 768;
      bool isTablet =
          constraints.maxWidth >= 768 && constraints.maxWidth < 1200;
      bool isDesktop = constraints.maxWidth >= 1200;

      return Stack(
        children: [
          CustomScrollView(
            slivers: [
              // Fixed AppBar menggunakan SliverPersistentHeader
              SliverPersistentHeader(
                pinned: true,
                delegate: _AppBarDelegate(
                  child: HomeAppBar(
                    onMenuPressed: _toggleDarkMode,
                    isDarkMode: _isDarkMode,
                    onAvatarPressed: () {},
                  ),
                ),
              ),

              // Main content
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Main Content - Centered
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(
                        top: isMobile ? 80 : 141,
                      ),
                      child: Center(
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            maxWidth:
                                _getMaxWidth(isMobile, isTablet, isDesktop),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                _getHorizontalPadding(isMobile, isTablet),
                          ),
                          child: _buildResponsiveLayout(isMobile, isTablet),
                        ),
                      ),
                    ),

                    // Bottom spacing
                    SizedBox(height: isMobile ? 40 : 80),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    });
  }

  double _getMaxWidth(bool isMobile, bool isTablet, bool isDesktop) {
    if (isMobile) return double.infinity;
    if (isTablet) return 1000;
    return 1400;
  }

  double _getHorizontalPadding(bool isMobile, bool isTablet) {
    if (isMobile) return 20;
    if (isTablet) return 40;
    return 60;
  }

  Widget _buildResponsiveLayout(bool isMobile, bool isTablet) {
    if (isMobile) {
      return _buildMobileLayout();
    } else if (isTablet) {
      return _buildTabletLayout();
    } else {
      return _buildDesktopLayout();
    }
  }

  // Mobile Layout - Stack vertically
  Widget _buildMobileLayout() {
    return Column(
      children: [
        HomeProfileDescriptionCardUi(),
        const SizedBox(height: 20),
        HomeAvatarSkillCardUi(),
        const SizedBox(height: 20),
        HomeProjectCardUi(),
        const SizedBox(height: 20),
        HomeExperienceCardUi(),
        const SizedBox(height: 20),
        HomeCertificateCardUi(),
        const SizedBox(height: 20),
        HomeContactCardUi(),
      ],
    );
  }

  // Tablet Layout - Mixed arrangement
  Widget _buildTabletLayout() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: HomeProfileDescriptionCardUi(),
            ),
            const SizedBox(width: 24),
            Expanded(
              flex: 1,
              child: HomeAvatarSkillCardUi(),
            ),
          ],
        ),
        const SizedBox(height: 24),
        HomeProjectCardUi(),
        const SizedBox(height: 20),
        HomeExperienceCardUi(),
        const SizedBox(height: 20),
        HomeCertificateCardUi(),
        const SizedBox(height: 20),
        HomeContactCardUi(),
      ],
    );
  }

  // Desktop Layout - Original 2x2 grid
  Widget _buildDesktopLayout() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: HomeProfileDescriptionCardUi(),
            ),
            const SizedBox(width: 44),
            Expanded(
              flex: 1,
              child: HomeAvatarSkillCardUi(),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: HomeProjectCardUi()),
            const SizedBox(width: 44),
            Expanded(flex: 2, child: HomeExperienceCardUi()),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: HomeCertificateCardUi()),
            const SizedBox(width: 44),
            Expanded(flex: 1, child: HomeContactCardUi()),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

// Custom delegate untuk SliverPersistentHeader
class _AppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _AppBarDelegate({
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: 80,
      child: child,
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
