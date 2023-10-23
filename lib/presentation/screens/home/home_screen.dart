import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miscellaneous_app/presentation/screens.dart';
import 'package:miscellaneous_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Miscellaneous App'),
        actions: [
          IconButton(
            onPressed: () {
              context.push(PermissionsScreen.routeName);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Miscelaneos'),
          ),
          MainMenu(),
        ],
      ),
    );
  }
}
