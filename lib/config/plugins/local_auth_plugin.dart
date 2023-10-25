import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class LocalAuthPlugin {
  static final LocalAuthentication auth = LocalAuthentication();

  static getAvailableBiometrics() async {
    final availableBiometrics = await auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {}

    if (availableBiometrics.contains(BiometricType.face) ||
        availableBiometrics.contains(BiometricType.strong)) {}
  }

  static Future<bool> canCheckBiometrics() async {
    return await auth.canCheckBiometrics;
  }

  static Future<(bool, String)> authenticate() async {
    try {
      final isAuthenticated = await auth.authenticate(
        localizedReason: 'Autenticarse para continuar',
      );

      return (
        isAuthenticated,
        isAuthenticated ? 'Hecho' : 'Cancelado por el usuario'
      );
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
        return (false, 'No se encuentra registrado');
      } else if (e.code == auth_error.notAvailable) {
        return (false, 'No se encuentra disponible');
      } else if (e.code == auth_error.passcodeNotSet) {
        return (false, 'No se encuentra configurado');
      } else if (e.code == auth_error.otherOperatingSystem) {
        return (false, 'No se encuentra disponible');
      } else if (e.code == auth_error.lockedOut) {
        return (false, 'Bloqueado');
      } else if (e.code == auth_error.permanentlyLockedOut) {
        return (false, 'Bloqueado');
      } else {
        return (false, 'Error desconocido');
      }
    }
  }
}
