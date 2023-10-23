import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscellaneous_app/presentation/screens/permissions/ask_permission_view.dart';

import '../../providers/providers.dart';

class CompassScreen extends ConsumerWidget {
  static const String routeName = '/compass';
  const CompassScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasAccess = ref.watch(permissionsProvider).locationGranted;
    if (!hasAccess) {
      return const AskLocationScreen();
    }
    final compassHeading = ref.watch(compassProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Compass',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
          child: compassHeading.when(
        data: (data) {
          return Compass(heading: data ?? 0);
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const CircularProgressIndicator(),
      )),
    );
  }
}

class Compass extends StatefulWidget {
  final double heading;
  const Compass({super.key, required this.heading});

  @override
  State<Compass> createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  double prevValue = 0.0;
  double turns = 0;

  double getTurns() {
    double? direction = widget.heading;
    direction = (direction < 0) ? (360 + direction) : direction;

    double diff = direction - prevValue;
    if (diff.abs() > 180) {
      if (prevValue > direction) {
        diff = 360 - (direction - prevValue).abs();
      } else {
        diff = 360 - (prevValue - direction).abs();
        diff = diff * -1;
      }
    }

    turns += (diff / 360);
    prevValue = direction;

    return turns * -1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '${widget.heading.ceil()}°',
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
        const SizedBox(height: 20),
        Stack(
          alignment: Alignment.center,
          children: [
            // Image.asset('assets/images/quadrant-1.png', height: 300),
            // Transform.rotate(
            //   angle: (widget.heading * pi / 180) * -1,
            //   child: Image.asset('assets/images/needle-1.png', height: 300),
            // ),
            AnimatedRotation(
              turns: getTurns(),
              curve: Curves.easeOut,
              duration: const Duration(seconds: 1),
              child: Image.asset('assets/images/quadrant-1.png'),
            ),
            Image.asset(
              'assets/images/needle-1.png',
            ),
          ],
        ),
      ],
    );
  }
}
