import 'package:anantla_pay/src/presentation/home/controllers/home_impl_provider.dart';
import 'package:anantla_pay/src/presentation/home/domain/usecases/get_balance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_balance_provider.g.dart';

@riverpod
GetBalance getBalance (GetBalanceRef ref) {
  return GetBalance(homeRepository: ref.watch(homeRepositoryProvider));
}