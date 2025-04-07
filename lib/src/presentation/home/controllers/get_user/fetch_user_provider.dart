import 'package:anantla_pay/src/core/main/domain/entities/user_model.dart';
import 'package:anantla_pay/src/core/main/domain/usecases/get_user.dart';
import 'package:anantla_pay/src/presentation/account/controllers/top_up/top_up_data_provider.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_user/get_user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_user_provider.g.dart';

@Riverpod(keepAlive: true)
class FetchUser extends _$FetchUser {
  @override
  FutureOr<UserModel?> build() {
    return null;
  }

  Future<void> fetchUser({
    required int userId,
    required Function(UserModel data) onSuccess,
    required Function() onError,
  }) async {
    state = const AsyncLoading();
    GetUser getUser = await ref.read(getUserProvider);
    final result = await getUser(GetUserParams(userId: userId));
    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onError();
      },
      (data) async {
        print('Full User Data: ${data.toJson()}');

        // final topUpData = ref.read(topUpDataNotifierProvider);
        // ref.read(topUpDataNotifierProvider.notifier).setVirtualAccountData(
        //       virtualAccountEmail: data.email,
        //       virtualAccountName: data.username,
        //       virtualAccountPhone: data.phone,
        //     );
        print('User data fetched: ${data.username}');
        print('User data fetched: ${data.email}');
        print('User data fetched: ${data.phone}');
        onSuccess(data);
        state = AsyncData(data);
      },
    );
  }
}
