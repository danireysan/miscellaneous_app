import 'package:miscellaneous_app/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<(PokemonEntity?, String)> getPokemon(int id);
}
