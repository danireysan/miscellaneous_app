import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class MagnetometerScreen extends ConsumerWidget {
  static const String routeName = '/magnetometer';
  const MagnetometerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final magnetometer = ref.watch(magnetometerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magnetometro'),
      ),
      body: Center(
        child: magnetometer.when(
          data: (data) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('x: ${data.x}'),
              Text('y: ${data.y}'),
              Text('z: ${data.z}'),
            ],
          ),
          error: (error, _) => Text('Error: $error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
