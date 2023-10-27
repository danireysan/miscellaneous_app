import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  static const routeName = '/map-screen';
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ControlledMapScreen'),
      ),
    );
  }
}
