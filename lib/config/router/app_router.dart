import 'package:go_router/go_router.dart';
import 'package:miscellaneous_app/presentation/screens/ads/add_fullscreen.dart';
import 'package:miscellaneous_app/presentation/screens/ads/add_rewarded.dart';
import 'package:miscellaneous_app/presentation/screens/badge/badge_screen.dart';
import 'package:miscellaneous_app/presentation/screens/biometrics/biometrics_screen.dart';

import '../../presentation/screens/pokemon/pokemon_screen.dart';
import '../../presentation/screens/pokemon/pokemons_screen.dart';
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
    GoRoute(
      path: PokemonsScreen.routeName,
      builder: (context, state) => const PokemonsScreen(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final int id =
                int.tryParse(state.pathParameters['id'] as String) ?? 0;

            return PokemonScreen(id: id);
          },
        ),
      ],
    ),
    GoRoute(
      path: BiometricsScreen.routeName,
      builder: (context, state) => const BiometricsScreen(),
    ),
    GoRoute(
      path: LocationScreen.routeName,
      builder: (context, state) => const LocationScreen(),
    ),
    GoRoute(
      path: MapScreen.routeName,
      builder: (context, state) => const MapScreen(),
    ),
    GoRoute(
      path: ControlledMapScreen.routeName,
      builder: (context, state) => const ControlledMapScreen(),
    ),
    GoRoute(
      path: BadgeScreen.routeName,
      builder: (context, state) => const BadgeScreen(),
    ),
    GoRoute(
      path: AdsFullScreen.routeName,
      builder: (context, state) => const AdsFullScreen(),
    ),
    GoRoute(
      path: AdsRewarded.routeName,
      builder: (context, state) => const AdsRewarded(),
    )
  ],
);
