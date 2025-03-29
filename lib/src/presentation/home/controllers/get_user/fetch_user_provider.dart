import 'package:anantla_pay/src/core/main/domain/entities/user_model.dart';
import 'package:anantla_pay/src/core/main/domain/usecases/get_user.dart';
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
    required Function() onSuccess,
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
        onSuccess();
        state = AsyncData(data);
      },
    );
  }
}
