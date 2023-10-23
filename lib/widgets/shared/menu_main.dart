import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miscellaneous_app/presentation/screens.dart';

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
    icon: Icons.home,
    route: GyroscopeScreen.routeName,
  ),
  MenuItem(
    title: 'Girosopio Bola',
    icon: Icons.home,
    route: GyroBallScreen.routeName,
  ),
  MenuItem(
    title: 'Acelerometro',
    icon: Icons.info,
    route: AccelerometerScreen.routeName,
  ),
  MenuItem(
    title: 'Magnetometro',
    icon: Icons.contact_page,
    route: MagnetometerScreen.routeName,
  ),
  MenuItem(
    title: 'Brújula',
    icon: Icons.settings,
    route: CompassScreen.routeName,
  ),
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
