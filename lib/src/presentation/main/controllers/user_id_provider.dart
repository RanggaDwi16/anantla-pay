import 'package:anantla_pay/src/core/provider/token_manager_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'token_manager_provider.dart';

part 'user_id_provider.g.dart';

@riverpod
Future<int?> userId(UserIdRef ref) async {
  final tokenManager = await ref.watch(tokenManagerProvider.future);
  return tokenManager.getUserId();
}
