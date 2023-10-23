import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscellaneous_app/presentation/providers/permissions/permissions_provider.dart';

class AskLocationScreen extends ConsumerWidget {
  const AskLocationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ask Location'),
      ),
      body: Center(
        child: FilledButton(
            child: const Text('Ask Location'),
            onPressed: () {
              ref
                  .read(permissionsProvider.notifier)
                  .requestLocationPermission();
            }),
      ),
    );
  }
}
