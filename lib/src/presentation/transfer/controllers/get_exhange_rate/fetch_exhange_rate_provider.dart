import 'package:anantla_pay/src/presentation/transfer/controllers/get_exhange_rate/get_exchange_rate_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/usecases/get_exchange_rate.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_exhange_rate_provider.g.dart';

@Riverpod(keepAlive: true)
class FetchExhangeRate extends _$FetchExhangeRate {
  @override
  FutureOr<String?> build() {
    return null;
  }

  Future<void> fetchExchangeRate({
    required String fromCurrency,
    required String toCurrency,
    required String amount,
  }) async {
    state = const AsyncLoading();
    GetExchangeRate getExchangeRate = await ref.read(getExchangeRateProvider);
    final result = await getExchangeRate.call(
      ExhangeRateParams(
        fromCurrency: fromCurrency,
        toCurrency: toCurrency,
        amount: amount,
      ),
      
    );
    state = result.fold(
      (error) => AsyncError(error, StackTrace.current),
      (exchangeRate) => AsyncData(exchangeRate),
    );
  }
}
