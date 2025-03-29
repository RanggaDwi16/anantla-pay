import 'package:anantla_pay/src/core/main/controllers/authentication_impl_provider.dart';
import 'package:anantla_pay/src/core/main/domain/usecases/logout.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_provider.g.dart';

@riverpod
Logout logout(LogoutRef ref) {
  return Logout(
      authenticationRepository: ref.read(authenticationRepositoryProvider));
}
