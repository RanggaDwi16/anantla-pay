import 'package:freezed_annotation/freezed_annotation.dart';

part 'virtual_account_model.freezed.dart';
part 'virtual_account_model.g.dart';

@freezed
class VirtualAccountModel with _$VirtualAccountModel {
  const factory VirtualAccountModel({
    @JsonKey(name: "access_token") String? accessToken,
    @JsonKey(name: "expires_in") int? expiresIn,
  }) = _VirtualAccountModel;

  factory VirtualAccountModel.fromJson(Map<String, dynamic> json) =>
      _$VirtualAccountModelFromJson(json);
}
