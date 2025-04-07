import 'package:anantla_pay/src/presentation/account/controllers/account_impl_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/top_up_vitual_account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'top_up_virtual_account_provider.g.dart';

@riverpod
TopUpVitualAccount topUpVitualAccount (TopUpVitualAccountRef ref) {
  return TopUpVitualAccount(accountRepository: ref.watch(accountRepositoryProvider));
}