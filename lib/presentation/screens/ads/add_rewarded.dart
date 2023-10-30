import 'package:flutter/material.dart';

class AdsRewarded extends StatelessWidget {
  static const routeName = '/add-rewarded';
  const AdsRewarded({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add rewarded'),
      ),
      body: const Center(
        child: Text(
          'Puntos actuales',
        ),
      ),
    );
  }
}
