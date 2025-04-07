// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InternalTransferParams _$InternalTransferParamsFromJson(
    Map<String, dynamic> json) {
  return _InternalTransferParams.fromJson(json);
}

/// @nodoc
mixin _$InternalTransferParams {
  @JsonKey(name: "from_wallet_id")
  int? get fromWalletId => throw _privateConstructorUsedError;
  @JsonKey(name: "to_wallet_id")
  int? get toWalletId => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  int? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "note")
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: "firebase_token")
  String? get firebaseToken => throw _privateConstructorUsedError;
  @JsonKey(name: "otp_code")
  String? get otpCode => throw _privateConstructorUsedError;

  /// Serializes this InternalTransferParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InternalTransferParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InternalTransferParamsCopyWith<InternalTransferParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InternalTransferParamsCopyWith<$Res> {
  factory $InternalTransferParamsCopyWith(InternalTransferParams value,
          $Res Function(InternalTransferParams) then) =
      _$InternalTransferParamsCopyWithImpl<$Res, InternalTransferParams>;
  @useResult
  $Res call(
      {@JsonKey(name: "from_wallet_id") int? fromWalletId,
      @JsonKey(name: "to_wallet_id") int? toWalletId,
      @JsonKey(name: "amount") int? amount,
      @JsonKey(name: "note") String? note,
      @JsonKey(name: "firebase_token") String? firebaseToken,
      @JsonKey(name: "otp_code") String? otpCode});
}

/// @nodoc
class _$InternalTransferParamsCopyWithImpl<$Res,
        $Val extends InternalTransferParams>
    implements $InternalTransferParamsCopyWith<$Res> {
  _$InternalTransferParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InternalTransferParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromWalletId = freezed,
    Object? toWalletId = freezed,
    Object? amount = freezed,
    Object? note = freezed,
    Object? firebaseToken = freezed,
    Object? otpCode = freezed,
  }) {
    return _then(_value.copyWith(
      fromWalletId: freezed == fromWalletId
          ? _value.fromWalletId
          : fromWalletId // ignore: cast_nullable_to_non_nullable
              as int?,
      toWalletId: freezed == toWalletId
          ? _value.toWalletId
          : toWalletId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
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
abstract class _$$InternalTransferParamsImplCopyWith<$Res>
    implements $InternalTransferParamsCopyWith<$Res> {
  factory _$$InternalTransferParamsImplCopyWith(
          _$InternalTransferParamsImpl value,
          $Res Function(_$InternalTransferParamsImpl) then) =
      __$$InternalTransferParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "from_wallet_id") int? fromWalletId,
      @JsonKey(name: "to_wallet_id") int? toWalletId,
      @JsonKey(name: "amount") int? amount,
      @JsonKey(name: "note") String? note,
      @JsonKey(name: "firebase_token") String? firebaseToken,
      @JsonKey(name: "otp_code") String? otpCode});
}

/// @nodoc
class __$$InternalTransferParamsImplCopyWithImpl<$Res>
    extends _$InternalTransferParamsCopyWithImpl<$Res,
        _$InternalTransferParamsImpl>
    implements _$$InternalTransferParamsImplCopyWith<$Res> {
  __$$InternalTransferParamsImplCopyWithImpl(
      _$InternalTransferParamsImpl _value,
      $Res Function(_$InternalTransferParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of InternalTransferParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromWalletId = freezed,
    Object? toWalletId = freezed,
    Object? amount = freezed,
    Object? note = freezed,
    Object? firebaseToken = freezed,
    Object? otpCode = freezed,
  }) {
    return _then(_$InternalTransferParamsImpl(
      fromWalletId: freezed == fromWalletId
          ? _value.fromWalletId
          : fromWalletId // ignore: cast_nullable_to_non_nullable
              as int?,
      toWalletId: freezed == toWalletId
          ? _value.toWalletId
          : toWalletId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
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
class _$InternalTransferParamsImpl implements _InternalTransferParams {
  const _$InternalTransferParamsImpl(
      {@JsonKey(name: "from_wallet_id") this.fromWalletId,
      @JsonKey(name: "to_wallet_id") this.toWalletId,
      @JsonKey(name: "amount") this.amount,
      @JsonKey(name: "note") this.note,
      @JsonKey(name: "firebase_token") this.firebaseToken,
      @JsonKey(name: "otp_code") this.otpCode});

  factory _$InternalTransferParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$InternalTransferParamsImplFromJson(json);

  @override
  @JsonKey(name: "from_wallet_id")
  final int? fromWalletId;
  @override
  @JsonKey(name: "to_wallet_id")
  final int? toWalletId;
  @override
  @JsonKey(name: "amount")
  final int? amount;
  @override
  @JsonKey(name: "note")
  final String? note;
  @override
  @JsonKey(name: "firebase_token")
  final String? firebaseToken;
  @override
  @JsonKey(name: "otp_code")
  final String? otpCode;

  @override
  String toString() {
    return 'InternalTransferParams(fromWalletId: $fromWalletId, toWalletId: $toWalletId, amount: $amount, note: $note, firebaseToken: $firebaseToken, otpCode: $otpCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InternalTransferParamsImpl &&
            (identical(other.fromWalletId, fromWalletId) ||
                other.fromWalletId == fromWalletId) &&
            (identical(other.toWalletId, toWalletId) ||
                other.toWalletId == toWalletId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.firebaseToken, firebaseToken) ||
                other.firebaseToken == firebaseToken) &&
            (identical(other.otpCode, otpCode) || other.otpCode == otpCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fromWalletId, toWalletId, amount,
      note, firebaseToken, otpCode);

  /// Create a copy of InternalTransferParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InternalTransferParamsImplCopyWith<_$InternalTransferParamsImpl>
      get copyWith => __$$InternalTransferParamsImplCopyWithImpl<
          _$InternalTransferParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InternalTransferParamsImplToJson(
      this,
    );
  }
}

abstract class _InternalTransferParams implements InternalTransferParams {
  const factory _InternalTransferParams(
          {@JsonKey(name: "from_wallet_id") final int? fromWalletId,
          @JsonKey(name: "to_wallet_id") final int? toWalletId,
          @JsonKey(name: "amount") final int? amount,
          @JsonKey(name: "note") final String? note,
          @JsonKey(name: "firebase_token") final String? firebaseToken,
          @JsonKey(name: "otp_code") final String? otpCode}) =
      _$InternalTransferParamsImpl;

  factory _InternalTransferParams.fromJson(Map<String, dynamic> json) =
      _$InternalTransferParamsImpl.fromJson;

  @override
  @JsonKey(name: "from_wallet_id")
  int? get fromWalletId;
  @override
  @JsonKey(name: "to_wallet_id")
  int? get toWalletId;
  @override
  @JsonKey(name: "amount")
  int? get amount;
  @override
  @JsonKey(name: "note")
  String? get note;
  @override
  @JsonKey(name: "firebase_token")
  String? get firebaseToken;
  @override
  @JsonKey(name: "otp_code")
  String? get otpCode;

  /// Create a copy of InternalTransferParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InternalTransferParamsImplCopyWith<_$InternalTransferParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CrossPspParams _$CrossPspParamsFromJson(Map<String, dynamic> json) {
  return _CrossPspParams.fromJson(json);
}

/// @nodoc
mixin _$CrossPspParams {
  @JsonKey(name: "from_wallet_id")
  int? get fromWalletId => throw _privateConstructorUsedError;
  @JsonKey(name: "to_wallet_id")
  int? get toWalletId => throw _privateConstructorUsedError;
  @JsonKey(name: "from_currency")
  String? get fromCurrency => throw _privateConstructorUsedError;
  @JsonKey(name: "to_currency")
  String? get toCurrency => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  int? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "note")
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this CrossPspParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CrossPspParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CrossPspParamsCopyWith<CrossPspParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrossPspParamsCopyWith<$Res> {
  factory $CrossPspParamsCopyWith(
          CrossPspParams value, $Res Function(CrossPspParams) then) =
      _$CrossPspParamsCopyWithImpl<$Res, CrossPspParams>;
  @useResult
  $Res call(
      {@JsonKey(name: "from_wallet_id") int? fromWalletId,
      @JsonKey(name: "to_wallet_id") int? toWalletId,
      @JsonKey(name: "from_currency") String? fromCurrency,
      @JsonKey(name: "to_currency") String? toCurrency,
      @JsonKey(name: "amount") int? amount,
      @JsonKey(name: "note") String? note});
}

/// @nodoc
class _$CrossPspParamsCopyWithImpl<$Res, $Val extends CrossPspParams>
    implements $CrossPspParamsCopyWith<$Res> {
  _$CrossPspParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CrossPspParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromWalletId = freezed,
    Object? toWalletId = freezed,
    Object? fromCurrency = freezed,
    Object? toCurrency = freezed,
    Object? amount = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      fromWalletId: freezed == fromWalletId
          ? _value.fromWalletId
          : fromWalletId // ignore: cast_nullable_to_non_nullable
              as int?,
      toWalletId: freezed == toWalletId
          ? _value.toWalletId
          : toWalletId // ignore: cast_nullable_to_non_nullable
              as int?,
      fromCurrency: freezed == fromCurrency
          ? _value.fromCurrency
          : fromCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      toCurrency: freezed == toCurrency
          ? _value.toCurrency
          : toCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CrossPspParamsImplCopyWith<$Res>
    implements $CrossPspParamsCopyWith<$Res> {
  factory _$$CrossPspParamsImplCopyWith(_$CrossPspParamsImpl value,
          $Res Function(_$CrossPspParamsImpl) then) =
      __$$CrossPspParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "from_wallet_id") int? fromWalletId,
      @JsonKey(name: "to_wallet_id") int? toWalletId,
      @JsonKey(name: "from_currency") String? fromCurrency,
      @JsonKey(name: "to_currency") String? toCurrency,
      @JsonKey(name: "amount") int? amount,
      @JsonKey(name: "note") String? note});
}

/// @nodoc
class __$$CrossPspParamsImplCopyWithImpl<$Res>
    extends _$CrossPspParamsCopyWithImpl<$Res, _$CrossPspParamsImpl>
    implements _$$CrossPspParamsImplCopyWith<$Res> {
  __$$CrossPspParamsImplCopyWithImpl(
      _$CrossPspParamsImpl _value, $Res Function(_$CrossPspParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CrossPspParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromWalletId = freezed,
    Object? toWalletId = freezed,
    Object? fromCurrency = freezed,
    Object? toCurrency = freezed,
    Object? amount = freezed,
    Object? note = freezed,
  }) {
    return _then(_$CrossPspParamsImpl(
      fromWalletId: freezed == fromWalletId
          ? _value.fromWalletId
          : fromWalletId // ignore: cast_nullable_to_non_nullable
              as int?,
      toWalletId: freezed == toWalletId
          ? _value.toWalletId
          : toWalletId // ignore: cast_nullable_to_non_nullable
              as int?,
      fromCurrency: freezed == fromCurrency
          ? _value.fromCurrency
          : fromCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      toCurrency: freezed == toCurrency
          ? _value.toCurrency
          : toCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CrossPspParamsImpl implements _CrossPspParams {
  const _$CrossPspParamsImpl(
      {@JsonKey(name: "from_wallet_id") this.fromWalletId,
      @JsonKey(name: "to_wallet_id") this.toWalletId,
      @JsonKey(name: "from_currency") this.fromCurrency,
      @JsonKey(name: "to_currency") this.toCurrency,
      @JsonKey(name: "amount") this.amount,
      @JsonKey(name: "note") this.note});

  factory _$CrossPspParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CrossPspParamsImplFromJson(json);

  @override
  @JsonKey(name: "from_wallet_id")
  final int? fromWalletId;
  @override
  @JsonKey(name: "to_wallet_id")
  final int? toWalletId;
  @override
  @JsonKey(name: "from_currency")
  final String? fromCurrency;
  @override
  @JsonKey(name: "to_currency")
  final String? toCurrency;
  @override
  @JsonKey(name: "amount")
  final int? amount;
  @override
  @JsonKey(name: "note")
  final String? note;

  @override
  String toString() {
    return 'CrossPspParams(fromWalletId: $fromWalletId, toWalletId: $toWalletId, fromCurrency: $fromCurrency, toCurrency: $toCurrency, amount: $amount, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrossPspParamsImpl &&
            (identical(other.fromWalletId, fromWalletId) ||
                other.fromWalletId == fromWalletId) &&
            (identical(other.toWalletId, toWalletId) ||
                other.toWalletId == toWalletId) &&
            (identical(other.fromCurrency, fromCurrency) ||
                other.fromCurrency == fromCurrency) &&
            (identical(other.toCurrency, toCurrency) ||
                other.toCurrency == toCurrency) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fromWalletId, toWalletId,
      fromCurrency, toCurrency, amount, note);

  /// Create a copy of CrossPspParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CrossPspParamsImplCopyWith<_$CrossPspParamsImpl> get copyWith =>
      __$$CrossPspParamsImplCopyWithImpl<_$CrossPspParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CrossPspParamsImplToJson(
      this,
    );
  }
}

abstract class _CrossPspParams implements CrossPspParams {
  const factory _CrossPspParams(
      {@JsonKey(name: "from_wallet_id") final int? fromWalletId,
      @JsonKey(name: "to_wallet_id") final int? toWalletId,
      @JsonKey(name: "from_currency") final String? fromCurrency,
      @JsonKey(name: "to_currency") final String? toCurrency,
      @JsonKey(name: "amount") final int? amount,
      @JsonKey(name: "note") final String? note}) = _$CrossPspParamsImpl;

  factory _CrossPspParams.fromJson(Map<String, dynamic> json) =
      _$CrossPspParamsImpl.fromJson;

  @override
  @JsonKey(name: "from_wallet_id")
  int? get fromWalletId;
  @override
  @JsonKey(name: "to_wallet_id")
  int? get toWalletId;
  @override
  @JsonKey(name: "from_currency")
  String? get fromCurrency;
  @override
  @JsonKey(name: "to_currency")
  String? get toCurrency;
  @override
  @JsonKey(name: "amount")
  int? get amount;
  @override
  @JsonKey(name: "note")
  String? get note;

  /// Create a copy of CrossPspParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CrossPspParamsImplCopyWith<_$CrossPspParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
