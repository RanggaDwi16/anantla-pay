// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_up_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TopupParams _$TopupParamsFromJson(Map<String, dynamic> json) {
  return _TopupParams.fromJson(json);
}

/// @nodoc
mixin _$TopupParams {
  @JsonKey(name: "wallet_id")
  int? get walletId => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  int? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "currency")
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: "firebase_token")
  String? get firebaseToken => throw _privateConstructorUsedError;
  @JsonKey(name: "otp_code")
  String? get otpCode => throw _privateConstructorUsedError;

  /// Serializes this TopupParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopupParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopupParamsCopyWith<TopupParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopupParamsCopyWith<$Res> {
  factory $TopupParamsCopyWith(
          TopupParams value, $Res Function(TopupParams) then) =
      _$TopupParamsCopyWithImpl<$Res, TopupParams>;
  @useResult
  $Res call(
      {@JsonKey(name: "wallet_id") int? walletId,
      @JsonKey(name: "amount") int? amount,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "firebase_token") String? firebaseToken,
      @JsonKey(name: "otp_code") String? otpCode});
}

/// @nodoc
class _$TopupParamsCopyWithImpl<$Res, $Val extends TopupParams>
    implements $TopupParamsCopyWith<$Res> {
  _$TopupParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopupParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletId = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? firebaseToken = freezed,
    Object? otpCode = freezed,
  }) {
    return _then(_value.copyWith(
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      firebaseToken: freezed == firebaseToken
          ? _value.firebaseToken
          : firebaseToken // ignore: cast_nullable_to_non_nullable
              as String?,
      otpCode: freezed == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopupParamsImplCopyWith<$Res>
    implements $TopupParamsCopyWith<$Res> {
  factory _$$TopupParamsImplCopyWith(
          _$TopupParamsImpl value, $Res Function(_$TopupParamsImpl) then) =
      __$$TopupParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "wallet_id") int? walletId,
      @JsonKey(name: "amount") int? amount,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "firebase_token") String? firebaseToken,
      @JsonKey(name: "otp_code") String? otpCode});
}

/// @nodoc
class __$$TopupParamsImplCopyWithImpl<$Res>
    extends _$TopupParamsCopyWithImpl<$Res, _$TopupParamsImpl>
    implements _$$TopupParamsImplCopyWith<$Res> {
  __$$TopupParamsImplCopyWithImpl(
      _$TopupParamsImpl _value, $Res Function(_$TopupParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TopupParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletId = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? firebaseToken = freezed,
    Object? otpCode = freezed,
  }) {
    return _then(_$TopupParamsImpl(
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      firebaseToken: freezed == firebaseToken
          ? _value.firebaseToken
          : firebaseToken // ignore: cast_nullable_to_non_nullable
              as String?,
      otpCode: freezed == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopupParamsImpl implements _TopupParams {
  const _$TopupParamsImpl(
      {@JsonKey(name: "wallet_id") this.walletId,
      @JsonKey(name: "amount") this.amount,
      @JsonKey(name: "currency") this.currency,
      @JsonKey(name: "firebase_token") this.firebaseToken,
      @JsonKey(name: "otp_code") this.otpCode});

  factory _$TopupParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopupParamsImplFromJson(json);

  @override
  @JsonKey(name: "wallet_id")
  final int? walletId;
  @override
  @JsonKey(name: "amount")
  final int? amount;
  @override
  @JsonKey(name: "currency")
  final String? currency;
  @override
  @JsonKey(name: "firebase_token")
  final String? firebaseToken;
  @override
  @JsonKey(name: "otp_code")
  final String? otpCode;

  @override
  String toString() {
    return 'TopupParams(walletId: $walletId, amount: $amount, currency: $currency, firebaseToken: $firebaseToken, otpCode: $otpCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopupParamsImpl &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.firebaseToken, firebaseToken) ||
                other.firebaseToken == firebaseToken) &&
            (identical(other.otpCode, otpCode) || other.otpCode == otpCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, walletId, amount, currency, firebaseToken, otpCode);

  /// Create a copy of TopupParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopupParamsImplCopyWith<_$TopupParamsImpl> get copyWith =>
      __$$TopupParamsImplCopyWithImpl<_$TopupParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopupParamsImplToJson(
      this,
    );
  }
}

abstract class _TopupParams implements TopupParams {
  const factory _TopupParams(
      {@JsonKey(name: "wallet_id") final int? walletId,
      @JsonKey(name: "amount") final int? amount,
      @JsonKey(name: "currency") final String? currency,
      @JsonKey(name: "firebase_token") final String? firebaseToken,
      @JsonKey(name: "otp_code") final String? otpCode}) = _$TopupParamsImpl;

  factory _TopupParams.fromJson(Map<String, dynamic> json) =
      _$TopupParamsImpl.fromJson;

  @override
  @JsonKey(name: "wallet_id")
  int? get walletId;
  @override
  @JsonKey(name: "amount")
  int? get amount;
  @override
  @JsonKey(name: "currency")
  String? get currency;
  @override
  @JsonKey(name: "firebase_token")
  String? get firebaseToken;
  @override
  @JsonKey(name: "otp_code")
  String? get otpCode;

  /// Create a copy of TopupParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopupParamsImplCopyWith<_$TopupParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VerifyOtpTopupParams _$VerifyOtpTopupParamsFromJson(Map<String, dynamic> json) {
  return _VerifyOtpTopupParams.fromJson(json);
}

/// @nodoc
mixin _$VerifyOtpTopupParams {
  @JsonKey(name: "wallet_id")
  int? get walletId => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  int? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "currency")
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: "firebase_token")
  String? get firebaseToken => throw _privateConstructorUsedError;
  @JsonKey(name: "otp_code")
  String? get otpCode => throw _privateConstructorUsedError;

  /// Serializes this VerifyOtpTopupParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyOtpTopupParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyOtpTopupParamsCopyWith<VerifyOtpTopupParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpTopupParamsCopyWith<$Res> {
  factory $VerifyOtpTopupParamsCopyWith(VerifyOtpTopupParams value,
          $Res Function(VerifyOtpTopupParams) then) =
      _$VerifyOtpTopupParamsCopyWithImpl<$Res, VerifyOtpTopupParams>;
  @useResult
  $Res call(
      {@JsonKey(name: "wallet_id") int? walletId,
      @JsonKey(name: "amount") int? amount,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "firebase_token") String? firebaseToken,
      @JsonKey(name: "otp_code") String? otpCode});
}

/// @nodoc
class _$VerifyOtpTopupParamsCopyWithImpl<$Res,
        $Val extends VerifyOtpTopupParams>
    implements $VerifyOtpTopupParamsCopyWith<$Res> {
  _$VerifyOtpTopupParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyOtpTopupParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletId = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? firebaseToken = freezed,
    Object? otpCode = freezed,
  }) {
    return _then(_value.copyWith(
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      firebaseToken: freezed == firebaseToken
          ? _value.firebaseToken
          : firebaseToken // ignore: cast_nullable_to_non_nullable
              as String?,
      otpCode: freezed == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyOtpTopupParamsImplCopyWith<$Res>
    implements $VerifyOtpTopupParamsCopyWith<$Res> {
  factory _$$VerifyOtpTopupParamsImplCopyWith(_$VerifyOtpTopupParamsImpl value,
          $Res Function(_$VerifyOtpTopupParamsImpl) then) =
      __$$VerifyOtpTopupParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "wallet_id") int? walletId,
      @JsonKey(name: "amount") int? amount,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "firebase_token") String? firebaseToken,
      @JsonKey(name: "otp_code") String? otpCode});
}

/// @nodoc
class __$$VerifyOtpTopupParamsImplCopyWithImpl<$Res>
    extends _$VerifyOtpTopupParamsCopyWithImpl<$Res, _$VerifyOtpTopupParamsImpl>
    implements _$$VerifyOtpTopupParamsImplCopyWith<$Res> {
  __$$VerifyOtpTopupParamsImplCopyWithImpl(_$VerifyOtpTopupParamsImpl _value,
      $Res Function(_$VerifyOtpTopupParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyOtpTopupParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletId = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? firebaseToken = freezed,
    Object? otpCode = freezed,
  }) {
    return _then(_$VerifyOtpTopupParamsImpl(
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      firebaseToken: freezed == firebaseToken
          ? _value.firebaseToken
          : firebaseToken // ignore: cast_nullable_to_non_nullable
              as String?,
      otpCode: freezed == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyOtpTopupParamsImpl implements _VerifyOtpTopupParams {
  const _$VerifyOtpTopupParamsImpl(
      {@JsonKey(name: "wallet_id") this.walletId,
      @JsonKey(name: "amount") this.amount,
      @JsonKey(name: "currency") this.currency,
      @JsonKey(name: "firebase_token") this.firebaseToken,
      @JsonKey(name: "otp_code") this.otpCode});

  factory _$VerifyOtpTopupParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyOtpTopupParamsImplFromJson(json);

  @override
  @JsonKey(name: "wallet_id")
  final int? walletId;
  @override
  @JsonKey(name: "amount")
  final int? amount;
  @override
  @JsonKey(name: "currency")
  final String? currency;
  @override
  @JsonKey(name: "firebase_token")
  final String? firebaseToken;
  @override
  @JsonKey(name: "otp_code")
  final String? otpCode;

  @override
  String toString() {
    return 'VerifyOtpTopupParams(walletId: $walletId, amount: $amount, currency: $currency, firebaseToken: $firebaseToken, otpCode: $otpCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpTopupParamsImpl &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.firebaseToken, firebaseToken) ||
                other.firebaseToken == firebaseToken) &&
            (identical(other.otpCode, otpCode) || other.otpCode == otpCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, walletId, amount, currency, firebaseToken, otpCode);

  /// Create a copy of VerifyOtpTopupParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpTopupParamsImplCopyWith<_$VerifyOtpTopupParamsImpl>
      get copyWith =>
          __$$VerifyOtpTopupParamsImplCopyWithImpl<_$VerifyOtpTopupParamsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyOtpTopupParamsImplToJson(
      this,
    );
  }
}

abstract class _VerifyOtpTopupParams implements VerifyOtpTopupParams {
  const factory _VerifyOtpTopupParams(
          {@JsonKey(name: "wallet_id") final int? walletId,
          @JsonKey(name: "amount") final int? amount,
          @JsonKey(name: "currency") final String? currency,
          @JsonKey(name: "firebase_token") final String? firebaseToken,
          @JsonKey(name: "otp_code") final String? otpCode}) =
      _$VerifyOtpTopupParamsImpl;

  factory _VerifyOtpTopupParams.fromJson(Map<String, dynamic> json) =
      _$VerifyOtpTopupParamsImpl.fromJson;

  @override
  @JsonKey(name: "wallet_id")
  int? get walletId;
  @override
  @JsonKey(name: "amount")
  int? get amount;
  @override
  @JsonKey(name: "currency")
  String? get currency;
  @override
  @JsonKey(name: "firebase_token")
  String? get firebaseToken;
  @override
  @JsonKey(name: "otp_code")
  String? get otpCode;

  /// Create a copy of VerifyOtpTopupParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOtpTopupParamsImplCopyWith<_$VerifyOtpTopupParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TopUpData {
  int? get walletId => throw _privateConstructorUsedError;
  int? get amount => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get referenceId => throw _privateConstructorUsedError;
  TopUpType get topUpType =>
      throw _privateConstructorUsedError; // ✅ Tipe Top-Up
// ✅ Virtual Account Fields
  String? get bankCode => throw _privateConstructorUsedError;
  String? get virtualAccountName => throw _privateConstructorUsedError;
  String? get virtualAccountEmail => throw _privateConstructorUsedError;
  String? get virtualAccountPhone => throw _privateConstructorUsedError;
  int? get totalAmount => throw _privateConstructorUsedError;

  /// Create a copy of TopUpData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopUpDataCopyWith<TopUpData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopUpDataCopyWith<$Res> {
  factory $TopUpDataCopyWith(TopUpData value, $Res Function(TopUpData) then) =
      _$TopUpDataCopyWithImpl<$Res, TopUpData>;
  @useResult
  $Res call(
      {int? walletId,
      int? amount,
      String? currency,
      String? referenceId,
      TopUpType topUpType,
      String? bankCode,
      String? virtualAccountName,
      String? virtualAccountEmail,
      String? virtualAccountPhone,
      int? totalAmount});
}

/// @nodoc
class _$TopUpDataCopyWithImpl<$Res, $Val extends TopUpData>
    implements $TopUpDataCopyWith<$Res> {
  _$TopUpDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopUpData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletId = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? referenceId = freezed,
    Object? topUpType = null,
    Object? bankCode = freezed,
    Object? virtualAccountName = freezed,
    Object? virtualAccountEmail = freezed,
    Object? virtualAccountPhone = freezed,
    Object? totalAmount = freezed,
  }) {
    return _then(_value.copyWith(
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceId: freezed == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      topUpType: null == topUpType
          ? _value.topUpType
          : topUpType // ignore: cast_nullable_to_non_nullable
              as TopUpType,
      bankCode: freezed == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String?,
      virtualAccountName: freezed == virtualAccountName
          ? _value.virtualAccountName
          : virtualAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      virtualAccountEmail: freezed == virtualAccountEmail
          ? _value.virtualAccountEmail
          : virtualAccountEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      virtualAccountPhone: freezed == virtualAccountPhone
          ? _value.virtualAccountPhone
          : virtualAccountPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopUpDataImplCopyWith<$Res>
    implements $TopUpDataCopyWith<$Res> {
  factory _$$TopUpDataImplCopyWith(
          _$TopUpDataImpl value, $Res Function(_$TopUpDataImpl) then) =
      __$$TopUpDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? walletId,
      int? amount,
      String? currency,
      String? referenceId,
      TopUpType topUpType,
      String? bankCode,
      String? virtualAccountName,
      String? virtualAccountEmail,
      String? virtualAccountPhone,
      int? totalAmount});
}

/// @nodoc
class __$$TopUpDataImplCopyWithImpl<$Res>
    extends _$TopUpDataCopyWithImpl<$Res, _$TopUpDataImpl>
    implements _$$TopUpDataImplCopyWith<$Res> {
  __$$TopUpDataImplCopyWithImpl(
      _$TopUpDataImpl _value, $Res Function(_$TopUpDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TopUpData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletId = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? referenceId = freezed,
    Object? topUpType = null,
    Object? bankCode = freezed,
    Object? virtualAccountName = freezed,
    Object? virtualAccountEmail = freezed,
    Object? virtualAccountPhone = freezed,
    Object? totalAmount = freezed,
  }) {
    return _then(_$TopUpDataImpl(
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceId: freezed == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      topUpType: null == topUpType
          ? _value.topUpType
          : topUpType // ignore: cast_nullable_to_non_nullable
              as TopUpType,
      bankCode: freezed == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String?,
      virtualAccountName: freezed == virtualAccountName
          ? _value.virtualAccountName
          : virtualAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      virtualAccountEmail: freezed == virtualAccountEmail
          ? _value.virtualAccountEmail
          : virtualAccountEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      virtualAccountPhone: freezed == virtualAccountPhone
          ? _value.virtualAccountPhone
          : virtualAccountPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$TopUpDataImpl implements _TopUpData {
  _$TopUpDataImpl(
      {this.walletId,
      this.amount,
      this.currency,
      this.referenceId,
      this.topUpType = TopUpType.normal,
      this.bankCode,
      this.virtualAccountName,
      this.virtualAccountEmail,
      this.virtualAccountPhone,
      this.totalAmount});

  @override
  final int? walletId;
  @override
  final int? amount;
  @override
  final String? currency;
  @override
  final String? referenceId;
  @override
  @JsonKey()
  final TopUpType topUpType;
// ✅ Tipe Top-Up
// ✅ Virtual Account Fields
  @override
  final String? bankCode;
  @override
  final String? virtualAccountName;
  @override
  final String? virtualAccountEmail;
  @override
  final String? virtualAccountPhone;
  @override
  final int? totalAmount;

  @override
  String toString() {
    return 'TopUpData(walletId: $walletId, amount: $amount, currency: $currency, referenceId: $referenceId, topUpType: $topUpType, bankCode: $bankCode, virtualAccountName: $virtualAccountName, virtualAccountEmail: $virtualAccountEmail, virtualAccountPhone: $virtualAccountPhone, totalAmount: $totalAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopUpDataImpl &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.referenceId, referenceId) ||
                other.referenceId == referenceId) &&
            (identical(other.topUpType, topUpType) ||
                other.topUpType == topUpType) &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode) &&
            (identical(other.virtualAccountName, virtualAccountName) ||
                other.virtualAccountName == virtualAccountName) &&
            (identical(other.virtualAccountEmail, virtualAccountEmail) ||
                other.virtualAccountEmail == virtualAccountEmail) &&
            (identical(other.virtualAccountPhone, virtualAccountPhone) ||
                other.virtualAccountPhone == virtualAccountPhone) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      walletId,
      amount,
      currency,
      referenceId,
      topUpType,
      bankCode,
      virtualAccountName,
      virtualAccountEmail,
      virtualAccountPhone,
      totalAmount);

  /// Create a copy of TopUpData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopUpDataImplCopyWith<_$TopUpDataImpl> get copyWith =>
      __$$TopUpDataImplCopyWithImpl<_$TopUpDataImpl>(this, _$identity);
}

abstract class _TopUpData implements TopUpData {
  factory _TopUpData(
      {final int? walletId,
      final int? amount,
      final String? currency,
      final String? referenceId,
      final TopUpType topUpType,
      final String? bankCode,
      final String? virtualAccountName,
      final String? virtualAccountEmail,
      final String? virtualAccountPhone,
      final int? totalAmount}) = _$TopUpDataImpl;

  @override
  int? get walletId;
  @override
  int? get amount;
  @override
  String? get currency;
  @override
  String? get referenceId;
  @override
  TopUpType get topUpType; // ✅ Tipe Top-Up
// ✅ Virtual Account Fields
  @override
  String? get bankCode;
  @override
  String? get virtualAccountName;
  @override
  String? get virtualAccountEmail;
  @override
  String? get virtualAccountPhone;
  @override
  int? get totalAmount;

  /// Create a copy of TopUpData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopUpDataImplCopyWith<_$TopUpDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VirtualAccountParams _$VirtualAccountParamsFromJson(Map<String, dynamic> json) {
  return _VirtualAccountParams.fromJson(json);
}

/// @nodoc
mixin _$VirtualAccountParams {
  @JsonKey(name: "wallet_id")
  int? get walletId => throw _privateConstructorUsedError;
  @JsonKey(name: "bank_code")
  String? get bankCode => throw _privateConstructorUsedError;
  @JsonKey(name: "trxId")
  String? get trxId => throw _privateConstructorUsedError;
  @JsonKey(name: "virtualAccountName")
  String? get virtualAccountName => throw _privateConstructorUsedError;
  @JsonKey(name: "virtualAccountEmail")
  String? get virtualAccountEmail => throw _privateConstructorUsedError;
  @JsonKey(name: "virtualAccountPhone")
  String? get virtualAccountPhone => throw _privateConstructorUsedError;
  @JsonKey(name: "platform_fee")
  int? get platformFee => throw _privateConstructorUsedError;
  @JsonKey(name: "partner_fee")
  int? get partnerFee => throw _privateConstructorUsedError;
  @JsonKey(name: "totalAmount")
  TotalAmount? get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  int? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "currency")
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: "cover_fee")
  bool? get coverFee => throw _privateConstructorUsedError;

  /// Serializes this VirtualAccountParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VirtualAccountParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VirtualAccountParamsCopyWith<VirtualAccountParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VirtualAccountParamsCopyWith<$Res> {
  factory $VirtualAccountParamsCopyWith(VirtualAccountParams value,
          $Res Function(VirtualAccountParams) then) =
      _$VirtualAccountParamsCopyWithImpl<$Res, VirtualAccountParams>;
  @useResult
  $Res call(
      {@JsonKey(name: "wallet_id") int? walletId,
      @JsonKey(name: "bank_code") String? bankCode,
      @JsonKey(name: "trxId") String? trxId,
      @JsonKey(name: "virtualAccountName") String? virtualAccountName,
      @JsonKey(name: "virtualAccountEmail") String? virtualAccountEmail,
      @JsonKey(name: "virtualAccountPhone") String? virtualAccountPhone,
      @JsonKey(name: "platform_fee") int? platformFee,
      @JsonKey(name: "partner_fee") int? partnerFee,
      @JsonKey(name: "totalAmount") TotalAmount? totalAmount,
      @JsonKey(name: "amount") int? amount,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "cover_fee") bool? coverFee});

  $TotalAmountCopyWith<$Res>? get totalAmount;
}

/// @nodoc
class _$VirtualAccountParamsCopyWithImpl<$Res,
        $Val extends VirtualAccountParams>
    implements $VirtualAccountParamsCopyWith<$Res> {
  _$VirtualAccountParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VirtualAccountParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletId = freezed,
    Object? bankCode = freezed,
    Object? trxId = freezed,
    Object? virtualAccountName = freezed,
    Object? virtualAccountEmail = freezed,
    Object? virtualAccountPhone = freezed,
    Object? platformFee = freezed,
    Object? partnerFee = freezed,
    Object? totalAmount = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? coverFee = freezed,
  }) {
    return _then(_value.copyWith(
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      bankCode: freezed == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String?,
      trxId: freezed == trxId
          ? _value.trxId
          : trxId // ignore: cast_nullable_to_non_nullable
              as String?,
      virtualAccountName: freezed == virtualAccountName
          ? _value.virtualAccountName
          : virtualAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      virtualAccountEmail: freezed == virtualAccountEmail
          ? _value.virtualAccountEmail
          : virtualAccountEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      virtualAccountPhone: freezed == virtualAccountPhone
          ? _value.virtualAccountPhone
          : virtualAccountPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      platformFee: freezed == platformFee
          ? _value.platformFee
          : platformFee // ignore: cast_nullable_to_non_nullable
              as int?,
      partnerFee: freezed == partnerFee
          ? _value.partnerFee
          : partnerFee // ignore: cast_nullable_to_non_nullable
              as int?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as TotalAmount?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      coverFee: freezed == coverFee
          ? _value.coverFee
          : coverFee // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of VirtualAccountParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TotalAmountCopyWith<$Res>? get totalAmount {
    if (_value.totalAmount == null) {
      return null;
    }

    return $TotalAmountCopyWith<$Res>(_value.totalAmount!, (value) {
      return _then(_value.copyWith(totalAmount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VirtualAccountParamsImplCopyWith<$Res>
    implements $VirtualAccountParamsCopyWith<$Res> {
  factory _$$VirtualAccountParamsImplCopyWith(_$VirtualAccountParamsImpl value,
          $Res Function(_$VirtualAccountParamsImpl) then) =
      __$$VirtualAccountParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "wallet_id") int? walletId,
      @JsonKey(name: "bank_code") String? bankCode,
      @JsonKey(name: "trxId") String? trxId,
      @JsonKey(name: "virtualAccountName") String? virtualAccountName,
      @JsonKey(name: "virtualAccountEmail") String? virtualAccountEmail,
      @JsonKey(name: "virtualAccountPhone") String? virtualAccountPhone,
      @JsonKey(name: "platform_fee") int? platformFee,
      @JsonKey(name: "partner_fee") int? partnerFee,
      @JsonKey(name: "totalAmount") TotalAmount? totalAmount,
      @JsonKey(name: "amount") int? amount,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "cover_fee") bool? coverFee});

  @override
  $TotalAmountCopyWith<$Res>? get totalAmount;
}

/// @nodoc
class __$$VirtualAccountParamsImplCopyWithImpl<$Res>
    extends _$VirtualAccountParamsCopyWithImpl<$Res, _$VirtualAccountParamsImpl>
    implements _$$VirtualAccountParamsImplCopyWith<$Res> {
  __$$VirtualAccountParamsImplCopyWithImpl(_$VirtualAccountParamsImpl _value,
      $Res Function(_$VirtualAccountParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of VirtualAccountParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletId = freezed,
    Object? bankCode = freezed,
    Object? trxId = freezed,
    Object? virtualAccountName = freezed,
    Object? virtualAccountEmail = freezed,
    Object? virtualAccountPhone = freezed,
    Object? platformFee = freezed,
    Object? partnerFee = freezed,
    Object? totalAmount = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? coverFee = freezed,
  }) {
    return _then(_$VirtualAccountParamsImpl(
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      bankCode: freezed == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String?,
      trxId: freezed == trxId
          ? _value.trxId
          : trxId // ignore: cast_nullable_to_non_nullable
              as String?,
      virtualAccountName: freezed == virtualAccountName
          ? _value.virtualAccountName
          : virtualAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      virtualAccountEmail: freezed == virtualAccountEmail
          ? _value.virtualAccountEmail
          : virtualAccountEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      virtualAccountPhone: freezed == virtualAccountPhone
          ? _value.virtualAccountPhone
          : virtualAccountPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      platformFee: freezed == platformFee
          ? _value.platformFee
          : platformFee // ignore: cast_nullable_to_non_nullable
              as int?,
      partnerFee: freezed == partnerFee
          ? _value.partnerFee
          : partnerFee // ignore: cast_nullable_to_non_nullable
              as int?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as TotalAmount?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      coverFee: freezed == coverFee
          ? _value.coverFee
          : coverFee // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VirtualAccountParamsImpl implements _VirtualAccountParams {
  const _$VirtualAccountParamsImpl(
      {@JsonKey(name: "wallet_id") this.walletId,
      @JsonKey(name: "bank_code") this.bankCode,
      @JsonKey(name: "trxId") this.trxId,
      @JsonKey(name: "virtualAccountName") this.virtualAccountName,
      @JsonKey(name: "virtualAccountEmail") this.virtualAccountEmail,
      @JsonKey(name: "virtualAccountPhone") this.virtualAccountPhone,
      @JsonKey(name: "platform_fee") this.platformFee,
      @JsonKey(name: "partner_fee") this.partnerFee,
      @JsonKey(name: "totalAmount") this.totalAmount,
      @JsonKey(name: "amount") this.amount,
      @JsonKey(name: "currency") this.currency,
      @JsonKey(name: "cover_fee") this.coverFee});

  factory _$VirtualAccountParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$VirtualAccountParamsImplFromJson(json);

  @override
  @JsonKey(name: "wallet_id")
  final int? walletId;
  @override
  @JsonKey(name: "bank_code")
  final String? bankCode;
  @override
  @JsonKey(name: "trxId")
  final String? trxId;
  @override
  @JsonKey(name: "virtualAccountName")
  final String? virtualAccountName;
  @override
  @JsonKey(name: "virtualAccountEmail")
  final String? virtualAccountEmail;
  @override
  @JsonKey(name: "virtualAccountPhone")
  final String? virtualAccountPhone;
  @override
  @JsonKey(name: "platform_fee")
  final int? platformFee;
  @override
  @JsonKey(name: "partner_fee")
  final int? partnerFee;
  @override
  @JsonKey(name: "totalAmount")
  final TotalAmount? totalAmount;
  @override
  @JsonKey(name: "amount")
  final int? amount;
  @override
  @JsonKey(name: "currency")
  final String? currency;
  @override
  @JsonKey(name: "cover_fee")
  final bool? coverFee;

  @override
  String toString() {
    return 'VirtualAccountParams(walletId: $walletId, bankCode: $bankCode, trxId: $trxId, virtualAccountName: $virtualAccountName, virtualAccountEmail: $virtualAccountEmail, virtualAccountPhone: $virtualAccountPhone, platformFee: $platformFee, partnerFee: $partnerFee, totalAmount: $totalAmount, amount: $amount, currency: $currency, coverFee: $coverFee)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VirtualAccountParamsImpl &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode) &&
            (identical(other.trxId, trxId) || other.trxId == trxId) &&
            (identical(other.virtualAccountName, virtualAccountName) ||
                other.virtualAccountName == virtualAccountName) &&
            (identical(other.virtualAccountEmail, virtualAccountEmail) ||
                other.virtualAccountEmail == virtualAccountEmail) &&
            (identical(other.virtualAccountPhone, virtualAccountPhone) ||
                other.virtualAccountPhone == virtualAccountPhone) &&
            (identical(other.platformFee, platformFee) ||
                other.platformFee == platformFee) &&
            (identical(other.partnerFee, partnerFee) ||
                other.partnerFee == partnerFee) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.coverFee, coverFee) ||
                other.coverFee == coverFee));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      walletId,
      bankCode,
      trxId,
      virtualAccountName,
      virtualAccountEmail,
      virtualAccountPhone,
      platformFee,
      partnerFee,
      totalAmount,
      amount,
      currency,
      coverFee);

  /// Create a copy of VirtualAccountParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VirtualAccountParamsImplCopyWith<_$VirtualAccountParamsImpl>
      get copyWith =>
          __$$VirtualAccountParamsImplCopyWithImpl<_$VirtualAccountParamsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VirtualAccountParamsImplToJson(
      this,
    );
  }
}

abstract class _VirtualAccountParams implements VirtualAccountParams {
  const factory _VirtualAccountParams(
      {@JsonKey(name: "wallet_id") final int? walletId,
      @JsonKey(name: "bank_code") final String? bankCode,
      @JsonKey(name: "trxId") final String? trxId,
      @JsonKey(name: "virtualAccountName") final String? virtualAccountName,
      @JsonKey(name: "virtualAccountEmail") final String? virtualAccountEmail,
      @JsonKey(name: "virtualAccountPhone") final String? virtualAccountPhone,
      @JsonKey(name: "platform_fee") final int? platformFee,
      @JsonKey(name: "partner_fee") final int? partnerFee,
      @JsonKey(name: "totalAmount") final TotalAmount? totalAmount,
      @JsonKey(name: "amount") final int? amount,
      @JsonKey(name: "currency") final String? currency,
      @JsonKey(name: "cover_fee")
      final bool? coverFee}) = _$VirtualAccountParamsImpl;

  factory _VirtualAccountParams.fromJson(Map<String, dynamic> json) =
      _$VirtualAccountParamsImpl.fromJson;

  @override
  @JsonKey(name: "wallet_id")
  int? get walletId;
  @override
  @JsonKey(name: "bank_code")
  String? get bankCode;
  @override
  @JsonKey(name: "trxId")
  String? get trxId;
  @override
  @JsonKey(name: "virtualAccountName")
  String? get virtualAccountName;
  @override
  @JsonKey(name: "virtualAccountEmail")
  String? get virtualAccountEmail;
  @override
  @JsonKey(name: "virtualAccountPhone")
  String? get virtualAccountPhone;
  @override
  @JsonKey(name: "platform_fee")
  int? get platformFee;
  @override
  @JsonKey(name: "partner_fee")
  int? get partnerFee;
  @override
  @JsonKey(name: "totalAmount")
  TotalAmount? get totalAmount;
  @override
  @JsonKey(name: "amount")
  int? get amount;
  @override
  @JsonKey(name: "currency")
  String? get currency;
  @override
  @JsonKey(name: "cover_fee")
  bool? get coverFee;

  /// Create a copy of VirtualAccountParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VirtualAccountParamsImplCopyWith<_$VirtualAccountParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TotalAmount _$TotalAmountFromJson(Map<String, dynamic> json) {
  return _TotalAmount.fromJson(json);
}

/// @nodoc
mixin _$TotalAmount {
  @JsonKey(name: "value")
  String? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "currency")
  String? get currency => throw _privateConstructorUsedError;

  /// Serializes this TotalAmount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TotalAmount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TotalAmountCopyWith<TotalAmount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TotalAmountCopyWith<$Res> {
  factory $TotalAmountCopyWith(
          TotalAmount value, $Res Function(TotalAmount) then) =
      _$TotalAmountCopyWithImpl<$Res, TotalAmount>;
  @useResult
  $Res call(
      {@JsonKey(name: "value") String? amount,
      @JsonKey(name: "currency") String? currency});
}

/// @nodoc
class _$TotalAmountCopyWithImpl<$Res, $Val extends TotalAmount>
    implements $TotalAmountCopyWith<$Res> {
  _$TotalAmountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TotalAmount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? currency = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TotalAmountImplCopyWith<$Res>
    implements $TotalAmountCopyWith<$Res> {
  factory _$$TotalAmountImplCopyWith(
          _$TotalAmountImpl value, $Res Function(_$TotalAmountImpl) then) =
      __$$TotalAmountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "value") String? amount,
      @JsonKey(name: "currency") String? currency});
}

/// @nodoc
class __$$TotalAmountImplCopyWithImpl<$Res>
    extends _$TotalAmountCopyWithImpl<$Res, _$TotalAmountImpl>
    implements _$$TotalAmountImplCopyWith<$Res> {
  __$$TotalAmountImplCopyWithImpl(
      _$TotalAmountImpl _value, $Res Function(_$TotalAmountImpl) _then)
      : super(_value, _then);

  /// Create a copy of TotalAmount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? currency = freezed,
  }) {
    return _then(_$TotalAmountImpl(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TotalAmountImpl implements _TotalAmount {
  const _$TotalAmountImpl(
      {@JsonKey(name: "value") this.amount,
      @JsonKey(name: "currency") this.currency});

  factory _$TotalAmountImpl.fromJson(Map<String, dynamic> json) =>
      _$$TotalAmountImplFromJson(json);

  @override
  @JsonKey(name: "value")
  final String? amount;
  @override
  @JsonKey(name: "currency")
  final String? currency;

  @override
  String toString() {
    return 'TotalAmount(amount: $amount, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TotalAmountImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, currency);

  /// Create a copy of TotalAmount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TotalAmountImplCopyWith<_$TotalAmountImpl> get copyWith =>
      __$$TotalAmountImplCopyWithImpl<_$TotalAmountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TotalAmountImplToJson(
      this,
    );
  }
}

abstract class _TotalAmount implements TotalAmount {
  const factory _TotalAmount(
      {@JsonKey(name: "value") final String? amount,
      @JsonKey(name: "currency") final String? currency}) = _$TotalAmountImpl;

  factory _TotalAmount.fromJson(Map<String, dynamic> json) =
      _$TotalAmountImpl.fromJson;

  @override
  @JsonKey(name: "value")
  String? get amount;
  @override
  @JsonKey(name: "currency")
  String? get currency;

  /// Create a copy of TotalAmount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TotalAmountImplCopyWith<_$TotalAmountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeeModel _$FeeModelFromJson(Map<String, dynamic> json) {
  return _FeeModel.fromJson(json);
}

/// @nodoc
mixin _$FeeModel {
  @JsonKey(name: "quote_id")
  String? get quoteId => throw _privateConstructorUsedError;
  @JsonKey(name: "currency")
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  int? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "cover_fee")
  bool? get coverFee => throw _privateConstructorUsedError;
  @JsonKey(name: "total_with_fee")
  String? get totalWithFee => throw _privateConstructorUsedError;
  @JsonKey(name: "platform_fee")
  String? get platformFee => throw _privateConstructorUsedError;
  @JsonKey(name: "partner_fee")
  String? get partnerFee => throw _privateConstructorUsedError;

  /// Serializes this FeeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeeModelCopyWith<FeeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeeModelCopyWith<$Res> {
  factory $FeeModelCopyWith(FeeModel value, $Res Function(FeeModel) then) =
      _$FeeModelCopyWithImpl<$Res, FeeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "quote_id") String? quoteId,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "amount") int? amount,
      @JsonKey(name: "cover_fee") bool? coverFee,
      @JsonKey(name: "total_with_fee") String? totalWithFee,
      @JsonKey(name: "platform_fee") String? platformFee,
      @JsonKey(name: "partner_fee") String? partnerFee});
}

/// @nodoc
class _$FeeModelCopyWithImpl<$Res, $Val extends FeeModel>
    implements $FeeModelCopyWith<$Res> {
  _$FeeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quoteId = freezed,
    Object? currency = freezed,
    Object? amount = freezed,
    Object? coverFee = freezed,
    Object? totalWithFee = freezed,
    Object? platformFee = freezed,
    Object? partnerFee = freezed,
  }) {
    return _then(_value.copyWith(
      quoteId: freezed == quoteId
          ? _value.quoteId
          : quoteId // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      coverFee: freezed == coverFee
          ? _value.coverFee
          : coverFee // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalWithFee: freezed == totalWithFee
          ? _value.totalWithFee
          : totalWithFee // ignore: cast_nullable_to_non_nullable
              as String?,
      platformFee: freezed == platformFee
          ? _value.platformFee
          : platformFee // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerFee: freezed == partnerFee
          ? _value.partnerFee
          : partnerFee // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeeModelImplCopyWith<$Res>
    implements $FeeModelCopyWith<$Res> {
  factory _$$FeeModelImplCopyWith(
          _$FeeModelImpl value, $Res Function(_$FeeModelImpl) then) =
      __$$FeeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "quote_id") String? quoteId,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "amount") int? amount,
      @JsonKey(name: "cover_fee") bool? coverFee,
      @JsonKey(name: "total_with_fee") String? totalWithFee,
      @JsonKey(name: "platform_fee") String? platformFee,
      @JsonKey(name: "partner_fee") String? partnerFee});
}

/// @nodoc
class __$$FeeModelImplCopyWithImpl<$Res>
    extends _$FeeModelCopyWithImpl<$Res, _$FeeModelImpl>
    implements _$$FeeModelImplCopyWith<$Res> {
  __$$FeeModelImplCopyWithImpl(
      _$FeeModelImpl _value, $Res Function(_$FeeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quoteId = freezed,
    Object? currency = freezed,
    Object? amount = freezed,
    Object? coverFee = freezed,
    Object? totalWithFee = freezed,
    Object? platformFee = freezed,
    Object? partnerFee = freezed,
  }) {
    return _then(_$FeeModelImpl(
      quoteId: freezed == quoteId
          ? _value.quoteId
          : quoteId // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      coverFee: freezed == coverFee
          ? _value.coverFee
          : coverFee // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalWithFee: freezed == totalWithFee
          ? _value.totalWithFee
          : totalWithFee // ignore: cast_nullable_to_non_nullable
              as String?,
      platformFee: freezed == platformFee
          ? _value.platformFee
          : platformFee // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerFee: freezed == partnerFee
          ? _value.partnerFee
          : partnerFee // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeeModelImpl implements _FeeModel {
  const _$FeeModelImpl(
      {@JsonKey(name: "quote_id") this.quoteId,
      @JsonKey(name: "currency") this.currency,
      @JsonKey(name: "amount") this.amount,
      @JsonKey(name: "cover_fee") this.coverFee,
      @JsonKey(name: "total_with_fee") this.totalWithFee,
      @JsonKey(name: "platform_fee") this.platformFee,
      @JsonKey(name: "partner_fee") this.partnerFee});

  factory _$FeeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeeModelImplFromJson(json);

  @override
  @JsonKey(name: "quote_id")
  final String? quoteId;
  @override
  @JsonKey(name: "currency")
  final String? currency;
  @override
  @JsonKey(name: "amount")
  final int? amount;
  @override
  @JsonKey(name: "cover_fee")
  final bool? coverFee;
  @override
  @JsonKey(name: "total_with_fee")
  final String? totalWithFee;
  @override
  @JsonKey(name: "platform_fee")
  final String? platformFee;
  @override
  @JsonKey(name: "partner_fee")
  final String? partnerFee;

  @override
  String toString() {
    return 'FeeModel(quoteId: $quoteId, currency: $currency, amount: $amount, coverFee: $coverFee, totalWithFee: $totalWithFee, platformFee: $platformFee, partnerFee: $partnerFee)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeeModelImpl &&
            (identical(other.quoteId, quoteId) || other.quoteId == quoteId) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.coverFee, coverFee) ||
                other.coverFee == coverFee) &&
            (identical(other.totalWithFee, totalWithFee) ||
                other.totalWithFee == totalWithFee) &&
            (identical(other.platformFee, platformFee) ||
                other.platformFee == platformFee) &&
            (identical(other.partnerFee, partnerFee) ||
                other.partnerFee == partnerFee));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, quoteId, currency, amount,
      coverFee, totalWithFee, platformFee, partnerFee);

  /// Create a copy of FeeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeeModelImplCopyWith<_$FeeModelImpl> get copyWith =>
      __$$FeeModelImplCopyWithImpl<_$FeeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeeModelImplToJson(
      this,
    );
  }
}

abstract class _FeeModel implements FeeModel {
  const factory _FeeModel(
      {@JsonKey(name: "quote_id") final String? quoteId,
      @JsonKey(name: "currency") final String? currency,
      @JsonKey(name: "amount") final int? amount,
      @JsonKey(name: "cover_fee") final bool? coverFee,
      @JsonKey(name: "total_with_fee") final String? totalWithFee,
      @JsonKey(name: "platform_fee") final String? platformFee,
      @JsonKey(name: "partner_fee") final String? partnerFee}) = _$FeeModelImpl;

  factory _FeeModel.fromJson(Map<String, dynamic> json) =
      _$FeeModelImpl.fromJson;

  @override
  @JsonKey(name: "quote_id")
  String? get quoteId;
  @override
  @JsonKey(name: "currency")
  String? get currency;
  @override
  @JsonKey(name: "amount")
  int? get amount;
  @override
  @JsonKey(name: "cover_fee")
  bool? get coverFee;
  @override
  @JsonKey(name: "total_with_fee")
  String? get totalWithFee;
  @override
  @JsonKey(name: "platform_fee")
  String? get platformFee;
  @override
  @JsonKey(name: "partner_fee")
  String? get partnerFee;

  /// Create a copy of FeeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeeModelImplCopyWith<_$FeeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
