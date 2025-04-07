import 'package:anantla_pay/src/core/main/controllers/authentication_impl_provider.dart';
import 'package:anantla_pay/src/core/main/domain/usecases/add_wish_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_wish_list_provider.g.dart';

@riverpod
AddWishList addWishList (AddWishListRef ref) {
  return AddWishList(authenticationRepository: ref.watch(authenticationRepositoryProvider));
}