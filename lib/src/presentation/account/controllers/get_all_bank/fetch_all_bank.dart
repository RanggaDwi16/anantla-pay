import 'package:anantla_pay/src/presentation/account/controllers/get_all_bank/get_all_bank.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/bank_model.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/get_all_bank.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_all_bank.g.dart';

@riverpod
class FetchAllBank extends _$FetchAllBank {
  @override
  FutureOr<List<BankModel>?> build() async {

    GetAllBank getAllBank = ref.read(getAllBankProvider);
    final result = await getAllBank.call(null);
    return result.fold(
      (error) => throw Exception(error),
      (banks) => banks,
    );
  }
}