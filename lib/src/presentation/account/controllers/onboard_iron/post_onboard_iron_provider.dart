import 'package:anantla_pay/src/presentation/account/controllers/onboard_iron/onboard_iron_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/onboard_iron.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_onboard_iron_provider.g.dart';

@Riverpod(keepAlive: true)
class PostOnboardIron extends _$PostOnboardIron {
  @override
  FutureOr<String?> build() {
    return null;
  }

  Future<void> postOnboardIron({
    required int userId,
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    state = const AsyncLoading();
    final onboardIron = ref.read(onboardIronProvider);
    final result = await onboardIron.call(
      OnboardIronParams(userId: userId),
    );
    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onError(error);
      },
      (message) {
        state = AsyncData(message);
        onSuccess(message);
      },
    );
  }
}
