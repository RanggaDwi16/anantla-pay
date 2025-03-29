import 'package:anantla_pay/src/core/main/controllers/authentication_impl_provider.dart';
import 'package:anantla_pay/src/core/main/domain/usecases/get_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_user_provider.g.dart';

@riverpod
GetUser getUser (GetUserRef ref) {
  return  GetUser(authenticationRepository: ref.watch(authenticationRepositoryProvider));
}