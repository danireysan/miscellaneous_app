import 'package:flutter/material.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon $id'),
      ),
      body: Center(
        child: Text('Pokemon $id'),
      ),
    );
  }
}
