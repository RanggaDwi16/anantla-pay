import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_local_provider.g.dart';

final _auth = LocalAuthentication();

@riverpod
Future<bool> hasBiometrics(HasBiometricsRef ref) async {
  final isAvailable = await _auth.canCheckBiometrics;
  final isDeviceSupported = await _auth.isDeviceSupported();
  return isAvailable && isDeviceSupported;
}

@riverpod
Future<bool> authenticateWithBiometrics(
    AuthenticateWithBiometricsRef ref) async {
  final isAuthAvailable = await ref.watch(hasBiometricsProvider.future);
  if (!isAuthAvailable) return false;

  try {
    final availableBiometrics = await _auth.getAvailableBiometrics();

    final isFace = availableBiometrics.contains(BiometricType.face);
    final isFingerprint =
        availableBiometrics.contains(BiometricType.fingerprint);

    final reason = isFace
        ? 'Use Face ID to login'
        : isFingerprint
            ? 'Touch your finger on the sensor to login'
            : 'Authenticate to login';

    return await _auth.authenticate(
      localizedReason: reason,
      options: const AuthenticationOptions(
        biometricOnly: false,
        stickyAuth: true,
        useErrorDialogs: true,
      ),
    );
  } catch (e) {
    return false;
  }
}
