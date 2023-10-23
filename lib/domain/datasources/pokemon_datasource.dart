import 'package:miscellaneous_app/domain/entities/pokemon_entity.dart';

abstract class PokemonDataSource {
  Future<(PokemonEntity?, String)> getPokemon(int id);
}
