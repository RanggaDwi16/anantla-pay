import 'package:anantla_pay/src/presentation/account/controllers/account_impl_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/get_fees.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_fees_provider.g.dart';

@riverpod
GetFees getFees(GetFeesRef ref) {
  return GetFees(accountRepository: ref.watch(accountRepositoryProvider));
}
