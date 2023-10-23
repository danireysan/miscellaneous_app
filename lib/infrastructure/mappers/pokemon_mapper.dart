import 'package:miscellaneous_app/domain/domain.dart';

import '../models/pokemon_api_response_model.dart';

class PokemonMapper {
  static PokemonEntity pokeApiToEntity(Map<String, dynamic> json) {
    final pokemonModel = PokeApiPokemonResponse.fromJson(json);

    return PokemonEntity(
      id: pokemonModel.id,
      name: pokemonModel.name,
      spriteFront: pokemonModel.sprites.frontDefault,
    );
  }
}
