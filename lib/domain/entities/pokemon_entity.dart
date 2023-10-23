import 'package:flutter/material.dart' show immutable;

@immutable
class PokemonEntity {
  final int id;
  final String name;
  final String spriteFront;

  const PokemonEntity({
    required this.id,
    required this.name,
    required this.spriteFront,
  });
}
