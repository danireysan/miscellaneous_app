import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miscellaneous_app/presentation/screens.dart';
import 'package:miscellaneous_app/presentation/screens/ads/add_rewarded.dart';

import '../../presentation/screens/ads/add_fullscreen.dart';
import '../../presentation/screens/badge/badge_screen.dart';
import '../../presentation/screens/biometrics/biometrics_screen.dart';
import '../../presentation/screens/pokemon/pokemons_screen.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final String route;

  const MenuItem({
    required this.title,
    required this.icon,
    required this.route,
  });
}

const List<MenuItem> items = [
  MenuItem(
    title: 'Girosopio',
    icon: Icons.downloading,
    route: GyroscopeScreen.routeName,
  ),
  MenuItem(
    title: 'Girosopio Bola',
    icon: Icons.sports_baseball_outlined,
    route: GyroBallScreen.routeName,
  ),
  MenuItem(
    title: 'Acelerometro',
    icon: Icons.speed,
    route: AccelerometerScreen.routeName,
  ),
  MenuItem(
    title: 'Magnetometro',
    icon: Icons.explore_outlined,
    route: MagnetometerScreen.routeName,
  ),
  MenuItem(
    title: 'Brújula',
    icon: Icons.explore,
    route: CompassScreen.routeName,
  ),
  MenuItem(
    title: 'Pokemons',
    icon: Icons.catching_pokemon,
    route: PokemonsScreen.routeName,
  ),
  MenuItem(
    title: 'Biometrics',
    icon: Icons.fingerprint,
    route: BiometricsScreen.routeName,
  ),
  MenuItem(
    title: 'Localización',
    icon: Icons.location_on_outlined,
    route: LocationScreen.routeName,
  ),
  MenuItem(
    title: 'Mapa Controlado',
    icon: Icons.gamepad_outlined,
    route: ControlledMapScreen.routeName,
  ),
  MenuItem(
    title: 'Mapa',
    icon: Icons.map_outlined,
    route: MapScreen.routeName,
  ),
  MenuItem(
    title: 'Badge',
    icon: Icons.notification_important,
    route: BadgeScreen.routeName,
  ),
  MenuItem(
    title: 'Ad full',
    icon: Icons.ad_units_rounded,
    route: AdsFullScreen.routeName,
  ),
  MenuItem(
    title: 'Ads rewards',
    icon: Icons.fort_sharp,
    route: AdsRewarded.routeName,
  )
];

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: items
          .map((item) => HomeMenuItem(
                title: item.title,
                route: item.route,
                icon: item.icon,
                bgColors: const [Colors.blue, Colors.blueAccent],
              ))
          .toList(),
    );
  }
}

class HomeMenuItem extends StatelessWidget {
  final String title;
  final String route;
  final IconData icon;
  final List<Color> bgColors;
  const HomeMenuItem({
    super.key,
    required this.title,
    required this.route,
    required this.icon,
    required this.bgColors,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: bgColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
