import 'package:anantla_pay/src/presentation/account/controllers/get_transaction/get_transaction_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/transaction_model.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/get_transaction.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_transaction_provider.g.dart';

@riverpod
class FetchTransaction extends _$FetchTransaction {
  @override
  FutureOr<List<TransactionModel>> build() async {
    GetTransaction getTransaction = ref.read(getTransactionProvider);
    final result = await getTransaction.call(null);

    return result.fold(
      (error) =>
          throw Exception('Failed to fetch transaction. Please Check Server'),
      (transaction) => transaction,
    );
  }
}
