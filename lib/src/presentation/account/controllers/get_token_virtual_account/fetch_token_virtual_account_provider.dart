import 'package:anantla_pay/src/core/provider/token_manager_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_token_virtual_account/get_token_virtual_account_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/virtual_account_model.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/get_token_virtual_account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_token_virtual_account_provider.g.dart';

@riverpod
class FetchTokenVirtualAccount extends _$FetchTokenVirtualAccount {
  @override
  FutureOr<VirtualAccountModel?> build() {
    return null;
  }

  Future<void> fetchTokenVirtualAccount({
    required Function() onSuccess,
    required Function() onError,
  }) async {
    GetTokenVirtualAccount getTokenVirtualAccount =
        await ref.read(getTokenVirtualAccountProvider);
    final result = await getTokenVirtualAccount(null);

    return result.fold(
      (error) {
        onError();
        throw Exception(error);
      },
      (virtualAccount) async {
        print('Virtual Account: $virtualAccount');
        TokenManager tokenManager = await ref.read(tokenManagerProvider.future);
        await tokenManager.saveTokenVirtualAccount(virtualAccount);

        // ✅ Panggil onSuccess dengan objek virtualAccount
        onSuccess();
      },
    );
  }
}
