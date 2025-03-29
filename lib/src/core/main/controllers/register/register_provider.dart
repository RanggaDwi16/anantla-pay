import 'package:anantla_pay/src/core/main/controllers/authentication_impl_provider.dart';
import 'package:anantla_pay/src/core/main/domain/usecases/register.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_provider.g.dart';

@riverpod
Register register (RegisterRef ref) {
  return  Register(
    authenticationRepository: ref.read(authenticationRepositoryProvider)
  );
}