import 'package:miscellaneous_app/infrastructure/datasources/pokemon_datasource_impl.dart';

import '../../domain/domain.dart';

class PokemonsRepositoryImpl extends PokemonRepository {
  final PokemonDataSource pokemonDataSource;

  PokemonsRepositoryImpl(PokemonDataSource? pokemonDataSource)
      : pokemonDataSource = pokemonDataSource ?? PokemonDataSourceImpl();

  @override
  Future<(PokemonEntity?, String)> getPokemon(int id) {
    return pokemonDataSource.getPokemon(id);
  }
}
