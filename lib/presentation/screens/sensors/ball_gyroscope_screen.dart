import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class GyroBallScreen extends ConsumerWidget {
  static const String routeName = '/gyroball';
  const GyroBallScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyro = ref.watch(gyroscopeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Giroscopio Bola'),
      ),
      body: gyro.when(
        data: (data) => SizedBox.expand(
          child: MovingBall(
            x: data.x,
            y: data.y,
          ),
        ),
        error: (error, stackTrace) => const Text('Error'),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class MovingBall extends StatelessWidget {
  final double x;
  final double y;
  const MovingBall({
    super.key,
    required this.x,
    required this.y,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fullWidth = size.width;
    final fullHeight = size.height;

    final currentYpos = (y * 150);
    final currentXpos = (x * 150);

    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          left: (currentYpos - 25) + fullWidth / 2,
          top: (currentXpos - 25) + fullHeight / 2,
          child: const Ball(),
        ),
        Text(
          '''
        x: ${x.toStringAsFixed(2)}
        y: ${y.toStringAsFixed(2)}
          ''',
          style: const TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}

class Ball extends StatelessWidget {
  const Ball({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
    );
  }
}
