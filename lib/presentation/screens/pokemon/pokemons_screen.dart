import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:miscellaneous_app/presentation/providers/providers.dart';

class PokemonsScreen extends StatelessWidget {
  static const String routeName = '/pokemons';
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PokemonsView(),
    );
  }
}

class PokemonsView extends ConsumerStatefulWidget {
  const PokemonsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PokemonsViewState();
}

class _PokemonsViewState extends ConsumerState<PokemonsView> {
  final scrollController = ScrollController();
  void infiniteScroll() {
    final currentPokemons = ref.read(pokemonsIdsProvider.notifier).state;
    if (currentPokemons.length > 100) {
      scrollController.removeListener(infiniteScroll);
    }

    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      ref.read(pokemonsIdsProvider.notifier).update((state) => [
            ...state,
            ...List.generate(
              30,
              (index) => state.length + index + 1,
            )
          ]);
    }
  }

  @override
  void initState() {
    scrollController.addListener(infiniteScroll);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          title: const Text('Pokemons'),
          floating: true,
          backgroundColor: Colors.white.withOpacity(0.8),
        ),
        const _PokemonGrid(),
      ],
    );
  }
}

class _PokemonGrid extends ConsumerWidget {
  const _PokemonGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonIds = ref.watch(pokemonsIdsProvider);

    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: pokemonIds.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.push(
              '${PokemonsScreen.routeName}/${index + 1}',
            );
          },
          child: Image.network(
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${index + 1}.png',
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }
}
