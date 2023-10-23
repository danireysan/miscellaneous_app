import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class AccelerometerScreen extends ConsumerWidget {
  static const String routeName = '/accelerometer';
  const AccelerometerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accelerometer = ref.watch(accelerometerUserProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aceleremetro'),
      ),
      body: accelerometer.when(
        data: (data) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('x: ${data.x}'),
              Text('y: ${data.y}'),
              Text('z: ${data.z}'),
            ],
          ),
        ),
        error: (error, _) => Text('Error: $error'),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
