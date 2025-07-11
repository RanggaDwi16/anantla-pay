import 'package:anantla_pay/src/presentation/home/controllers/get_balance/get_balance_provider.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/balance_model.dart';
import 'package:anantla_pay/src/presentation/home/domain/usecases/get_balance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_balance_provider.g.dart';

@riverpod
class FetchBalance extends _$FetchBalance {
  @override
  FutureOr<List<BalanceModel>?> build() async {
    GetBalance getBalance = ref.watch(getBalanceProvider);
    final result = await getBalance.call(null);
    return result.fold(
      (error) => throw Exception('Failed to fetch balance. Please Check Server'),
      (balance) => balance,
    );
  }
}
