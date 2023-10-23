import 'package:go_router/go_router.dart';

import '../../presentation/screens.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: PermissionsScreen.routeName,
      builder: (context, state) => const PermissionsScreen(),
    ),
    GoRoute(
      path: AccelerometerScreen.routeName,
      builder: (context, state) => const AccelerometerScreen(),
    ),
    GoRoute(
      path: GyroscopeScreen.routeName,
      builder: (context, state) => const GyroscopeScreen(),
    ),
    GoRoute(
      path: MagnetometerScreen.routeName,
      builder: (context, state) => const MagnetometerScreen(),
    ),
    GoRoute(
      path: GyroBallScreen.routeName,
      builder: (context, state) => const GyroBallScreen(),
    ),
    GoRoute(
      path: CompassScreen.routeName,
      builder: (context, state) => const CompassScreen(),
    ),
  ],
);
