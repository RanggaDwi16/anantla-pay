import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
  const factory LoginModel({
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "token") String? token,
    @JsonKey(name: "user") User? user,
    @JsonKey(name: "client") Client? client,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}

@freezed
class Client with _$Client {
  const factory Client({
    @JsonKey(name: "client_id") int? clientId,
    @JsonKey(name: "client_type") String? clientType,
    @JsonKey(name: "client_status") String? clientStatus,
    @JsonKey(name: "kyc_status") String? kycStatus,
  }) = _Client;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "role") String? role,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
