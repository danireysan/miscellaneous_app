import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class LocationScreen extends ConsumerWidget {
  static const routeName = '/location-screen';
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocationAsync = ref.watch(userLocationProvider);
    final watchLocaltionAsync = ref.watch(watchLocationProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ControlledMapScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Ubicación actual"),
            userLocationAsync.when(
              data: (data) => Text('$data'),
              error: (e, s) => Text('Error: $e'),
              loading: () => const CircularProgressIndicator(),
            ),
            const SizedBox(height: 30),
            const Text('Seguimiento de ubicación'),
            watchLocaltionAsync.when(
              data: (data) => Text('$data'),
              error: (e, s) => Text('Error: $e'),
              loading: () => const CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
