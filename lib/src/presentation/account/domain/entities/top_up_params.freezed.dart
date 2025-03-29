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
  @JsonKey(name: "reference_id")
  String? get referenceId => throw _privateConstructorUsedError;

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
      @JsonKey(name: "reference_id") String? referenceId});
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
    Object? referenceId = freezed,
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
      @JsonKey(name: "reference_id") String? referenceId});
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
    Object? referenceId = freezed,
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
      referenceId: freezed == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: "reference_id") this.referenceId});

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
  @JsonKey(name: "reference_id")
  final String? referenceId;

  @override
  String toString() {
    return 'TopupParams(walletId: $walletId, amount: $amount, currency: $currency, referenceId: $referenceId)';
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
            (identical(other.referenceId, referenceId) ||
                other.referenceId == referenceId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, walletId, amount, currency, referenceId);

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
          @JsonKey(name: "reference_id") final String? referenceId}) =
      _$TopupParamsImpl;

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
  @JsonKey(name: "reference_id")
  String? get referenceId;

  /// Create a copy of TopupParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopupParamsImplCopyWith<_$TopupParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TopUpData {
  int? get walletId => throw _privateConstructorUsedError;
  int? get amount => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get referenceId => throw _privateConstructorUsedError;

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
      {int? walletId, int? amount, String? currency, String? referenceId});
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
      {int? walletId, int? amount, String? currency, String? referenceId});
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
    ));
  }
}

/// @nodoc

class _$TopUpDataImpl implements _TopUpData {
  const _$TopUpDataImpl(
      {this.walletId, this.amount, this.currency, this.referenceId});

  @override
  final int? walletId;
  @override
  final int? amount;
  @override
  final String? currency;
  @override
  final String? referenceId;

  @override
  String toString() {
    return 'TopUpData(walletId: $walletId, amount: $amount, currency: $currency, referenceId: $referenceId)';
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
                other.referenceId == referenceId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, walletId, amount, currency, referenceId);

  /// Create a copy of TopUpData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopUpDataImplCopyWith<_$TopUpDataImpl> get copyWith =>
      __$$TopUpDataImplCopyWithImpl<_$TopUpDataImpl>(this, _$identity);
}

abstract class _TopUpData implements TopUpData {
  const factory _TopUpData(
      {final int? walletId,
      final int? amount,
      final String? currency,
      final String? referenceId}) = _$TopUpDataImpl;

  @override
  int? get walletId;
  @override
  int? get amount;
  @override
  String? get currency;
  @override
  String? get referenceId;

  /// Create a copy of TopUpData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopUpDataImplCopyWith<_$TopUpDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
