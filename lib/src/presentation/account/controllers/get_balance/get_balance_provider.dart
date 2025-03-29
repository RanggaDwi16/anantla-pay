import 'package:anantla_pay/src/presentation/account/controllers/account_impl_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/get_balance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_balance_provider.g.dart';

@riverpod
GetBalance getBalance(GetBalanceRef ref) {
  return GetBalance(accountRepository: ref.watch(accountRepositoryProvider));
}
