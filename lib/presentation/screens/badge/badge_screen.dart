import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscellaneous_app/config/plugins/badge_plugin.dart';

import '../../providers/badge/badge_provider.dart';

class BadgeScreen extends ConsumerWidget {
  static const routeName = '/badge';
  const BadgeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final badgeNumber = ref.watch(badgeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Badge'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BadgePlugin.updateAppBadger(badgeNumber);
          ref.read(badgeProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Badge(
              alignment: Alignment.lerp(
                  Alignment.topRight, Alignment.bottomRight, 0.2),
              label: Text('$badgeNumber'),
              child: Text(
                '$badgeNumber',
                style: const TextStyle(fontSize: 150),
              ),
            ),
            FilledButton.tonal(
              onPressed: () {
                BadgePlugin.removeAppBadger();
                ref.invalidate(badgeProvider);
              },
              child: const Text('Borrar badge'),
            )
          ],
        ),
      ),
    );
  }
}
