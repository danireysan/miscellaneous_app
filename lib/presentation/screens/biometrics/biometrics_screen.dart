import 'package:flutter/material.dart';

class BiometricsScreen extends StatelessWidget {
  static const routeName = '/biometrics';
  const BiometricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometrics'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Biometrics'),
            const SizedBox(height: 20),
            FilledButton.tonal(
              onPressed: () {},
              child: const Text('Autenticar'),
            )
          ],
        ),
      ),
    );
  }
}
