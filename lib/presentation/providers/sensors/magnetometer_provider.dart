import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

class MagnetormeterXYZ {
  final double x;
  final double y;
  final double z;

  MagnetormeterXYZ(this.x, this.y, this.z);

  @override
  String toString() {
    return 'x: $x, y: $y, z: $z';
  }
}

final magnetometerProvider =
    StreamProvider.autoDispose<MagnetormeterXYZ>((ref) async* {
  await for (final event in magnetometerEvents) {
    final x = double.parse(event.x.toStringAsFixed(2));
    final y = double.parse(event.y.toStringAsFixed(2));
    final z = double.parse(event.z.toStringAsFixed(2));
    yield MagnetormeterXYZ(x, y, z);
  }
});
