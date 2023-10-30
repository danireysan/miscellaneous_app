import 'package:flutter/material.dart';

class AdsFullScreen extends StatelessWidget {
  static const routeName = '/add_fullscreen';
  const AdsFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add full screen'),
      ),
      body: const Center(
        child: Text(
          'Ya puedes regresar o ver esta pantalla',
        ),
      ),
    );
  }
}
