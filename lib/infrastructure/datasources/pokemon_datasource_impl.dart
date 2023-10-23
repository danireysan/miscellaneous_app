import 'package:dio/dio.dart';

import '../../domain/domain.dart';
import '../mappers/pokemon_mapper.dart';

class PokemonDataSourceImpl implements PokemonDataSource {
  final Dio dio;

  PokemonDataSourceImpl()
      : dio = Dio(
          BaseOptions(baseUrl: 'https://pokeapi.co/api/v2'),
        );

  @override
  Future<(PokemonEntity?, String)> getPokemon(int id) async {
    try {
      final response = await dio.get('/pokemon/$id');

      final pokemon = PokemonMapper.pokeApiToEntity(response.data);

      return (pokemon, '');
    } catch (e) {
      return (null, e.toString());
    }
  }
}
