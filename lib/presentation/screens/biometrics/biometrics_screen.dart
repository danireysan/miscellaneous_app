import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/local_auth/local_auth_provider.dart';

class BiometricsScreen extends ConsumerWidget {
  static const routeName = '/biometrics';
  const BiometricsScreen({super.key});

  get error => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncBiometrics = ref.watch(canCheckBiometricsProvider);
    final localAuthState = ref.watch(localAuthProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometrics'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                ref.read(localAuthProvider.notifier).authenticateUser();
              },
              child: const Text('Autenticar'),
            ),
            asyncBiometrics.when(
              data: (canCheck) => Text('Puede checar biometricos: $canCheck'),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
            const SizedBox(height: 40),
            const Text(
              'Estado de el biometrico',
              style: TextStyle(fontSize: 20),
            ),
            Text('Estado: $localAuthState'),
          ],
        ),
      ),
    );
  }
}
