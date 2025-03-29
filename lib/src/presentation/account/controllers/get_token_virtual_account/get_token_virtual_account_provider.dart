import 'package:anantla_pay/src/presentation/account/controllers/account_impl_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/get_token_virtual_account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_token_virtual_account_provider.g.dart';

@riverpod
GetTokenVirtualAccount getTokenVirtualAccount (GetTokenVirtualAccountRef ref) {
  return GetTokenVirtualAccount(accountRepository: ref.read(accountRepositoryProvider));
}