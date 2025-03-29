// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletModelImpl _$$WalletModelImplFromJson(Map<String, dynamic> json) =>
    _$WalletModelImpl(
      walletId: (json['wallet_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      username: json['username'] as String?,
      phone: json['phone'],
      countryCode: json['country_code'] as String?,
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$$WalletModelImplToJson(_$WalletModelImpl instance) =>
    <String, dynamic>{
      'wallet_id': instance.walletId,
      'user_id': instance.userId,
      'username': instance.username,
      'phone': instance.phone,
      'country_code': instance.countryCode,
      'currency': instance.currency,
    };
