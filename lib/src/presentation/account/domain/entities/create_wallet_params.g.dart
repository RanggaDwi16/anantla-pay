// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_wallet_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateWalletParamsImpl _$$CreateWalletParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateWalletParamsImpl(
      userId: (json['user_id'] as num?)?.toInt(),
      countryCode: json['country_code'] as String?,
    );

Map<String, dynamic> _$$CreateWalletParamsImplToJson(
        _$CreateWalletParamsImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'country_code': instance.countryCode,
    };
