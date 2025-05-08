import 'package:anantla_pay/src/presentation/transfer/controllers/get_all_bank/get_all_bank_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/bank_model.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/usecases/get_all_bank.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_all_bank_provider.g.dart';

@riverpod
class FetchAllBank extends _$FetchAllBank {
  @override
  FutureOr<List<BankModel>?> build() async {
    GetAllBank getAllBank = ref.watch(getAllBankProvider);
    final result = await getAllBank.call(null);
    return result.fold(
      (error) {
        // Handle error here if needed
        return null;
      },
      (bankList) {
        return bankList;
      },
    );
  }
}
