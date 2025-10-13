// lib/core/routes/app_router.dart
import 'package:auto_route/auto_route.dart';
import 'package:haidar_website/features/home/presentation/pages/home_page.dart';
import 'package:injectable/injectable.dart';

part 'app_router.gr.dart';

@lazySingleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
      ];
}
