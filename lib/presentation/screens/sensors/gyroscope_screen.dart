import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/sensors/gyroscope_provider.dart';

class GyroscopeScreen extends ConsumerWidget {
  static const String routeName = '/gyroscope';
  const GyroscopeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyroscope = ref.watch(gyroscopeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giroscopio'),
      ),
      body: Center(
        child: gyroscope.when(
          data: (data) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'X: ${data.x}',
              ),
              Text(
                'Y: ${data.y}',
              ),
              Text(
                'Z: ${data.z}',
              ),
            ],
          ),
          error: (error, stackTrace) => Text(
            'Error: $error',
          ),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
