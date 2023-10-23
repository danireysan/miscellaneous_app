import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscellaneous_app/domain/domain.dart';
import 'package:miscellaneous_app/infrastructure/infrastructure.dart';

final pokemonRepositoryProvider = Provider<PokemonRepository>((ref) {
  return PokemonsRepositoryImpl(null);
});

final pokemonProvider =
    FutureProvider.family<PokemonEntity, String>((ref, id) async {
  final repository = ref.watch(pokemonRepositoryProvider);

  final (pokemon, error) = await repository.getPokemon(int.parse(id));

  if (pokemon != null) return pokemon;

  throw Exception(error);
});
