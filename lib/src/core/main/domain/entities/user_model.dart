import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "client_id") int? clientId,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "role") String? role,
    @JsonKey(name: "user_status") String? userStatus,
    @JsonKey(name: "country_code") String? countryCode,
    @JsonKey(name: "e_kyc_status") String? eKycStatus,
    @JsonKey(name: "phone") dynamic phone,
    @JsonKey(name: "created") DateTime? created,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
