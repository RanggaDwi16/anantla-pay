import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_impl_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/usecases/get_exchange_rate.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_exchange_rate_provider.g.dart';

@riverpod
GetExchangeRate getExchangeRate (GetExchangeRateRef ref) {
  return GetExchangeRate(repository: ref.watch(transferRepositoryProvider));
}