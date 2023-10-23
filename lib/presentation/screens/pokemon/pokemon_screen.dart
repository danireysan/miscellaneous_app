import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscellaneous_app/config/config.dart';
import 'package:miscellaneous_app/domain/domain.dart';
import 'package:miscellaneous_app/presentation/providers/pokemon/pokemon_provider.dart';

class PokemonScreen extends ConsumerWidget {
  const PokemonScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonAsync = ref.watch(pokemonProvider(id.toString()));

    return pokemonAsync.when(
      data: (data) => _PokemonView(pokemon: data),
      error: (error, stackTrace) => _ErrorWidget(error.toString()),
      loading: () => const _LoadingWidget(),
    );
  }
}

class _PokemonView extends StatelessWidget {
  final PokemonEntity pokemon;
  const _PokemonView({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon ${pokemon.name}'),
        actions: [
          IconButton(
            onPressed: () {
              SharePlugin.shareLink(pokemon.spriteFront, 'Mirá este pokemon');
            },
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: Center(
        child: Image.network(
          pokemon.spriteFront,
          fit: BoxFit.contain,
          height: 150,
          width: 150,
        ),
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final String error;
  const _ErrorWidget(this.error);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Text(error),
      ),
    );
  }
}

// loading widget
class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading'),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
