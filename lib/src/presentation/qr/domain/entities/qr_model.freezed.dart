// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QrModel _$QrModelFromJson(Map<String, dynamic> json) {
  return _QrModel.fromJson(json);
}

/// @nodoc
mixin _$QrModel {
  @JsonKey(name: "provider")
  String? get provider => throw _privateConstructorUsedError;
  @JsonKey(name: "account")
  String? get account => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  String? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "currency")
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: "merchant")
  String? get merchant => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;

  /// Serializes this QrModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QrModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QrModelCopyWith<QrModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrModelCopyWith<$Res> {
  factory $QrModelCopyWith(QrModel value, $Res Function(QrModel) then) =
      _$QrModelCopyWithImpl<$Res, QrModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "provider") String? provider,
      @JsonKey(name: "account") String? account,
      @JsonKey(name: "amount") String? amount,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "merchant") String? merchant,
      @JsonKey(name: "type") String? type});
}

/// @nodoc
class _$QrModelCopyWithImpl<$Res, $Val extends QrModel>
    implements $QrModelCopyWith<$Res> {
  _$QrModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QrModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provider = freezed,
    Object? account = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? merchant = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      merchant: freezed == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QrModelImplCopyWith<$Res> implements $QrModelCopyWith<$Res> {
  factory _$$QrModelImplCopyWith(
          _$QrModelImpl value, $Res Function(_$QrModelImpl) then) =
      __$$QrModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "provider") String? provider,
      @JsonKey(name: "account") String? account,
      @JsonKey(name: "amount") String? amount,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "merchant") String? merchant,
      @JsonKey(name: "type") String? type});
}

/// @nodoc
class __$$QrModelImplCopyWithImpl<$Res>
    extends _$QrModelCopyWithImpl<$Res, _$QrModelImpl>
    implements _$$QrModelImplCopyWith<$Res> {
  __$$QrModelImplCopyWithImpl(
      _$QrModelImpl _value, $Res Function(_$QrModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QrModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provider = freezed,
    Object? account = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? merchant = freezed,
    Object? type = freezed,
  }) {
    return _then(_$QrModelImpl(
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      merchant: freezed == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QrModelImpl implements _QrModel {
  const _$QrModelImpl(
      {@JsonKey(name: "provider") this.provider,
      @JsonKey(name: "account") this.account,
      @JsonKey(name: "amount") this.amount,
      @JsonKey(name: "currency") this.currency,
      @JsonKey(name: "merchant") this.merchant,
      @JsonKey(name: "type") this.type});

  factory _$QrModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QrModelImplFromJson(json);

  @override
  @JsonKey(name: "provider")
  final String? provider;
  @override
  @JsonKey(name: "account")
  final String? account;
  @override
  @JsonKey(name: "amount")
  final String? amount;
  @override
  @JsonKey(name: "currency")
  final String? currency;
  @override
  @JsonKey(name: "merchant")
  final String? merchant;
  @override
  @JsonKey(name: "type")
  final String? type;

  @override
  String toString() {
    return 'QrModel(provider: $provider, account: $account, amount: $amount, currency: $currency, merchant: $merchant, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrModelImpl &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.merchant, merchant) ||
                other.merchant == merchant) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, provider, account, amount, currency, merchant, type);

  /// Create a copy of QrModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QrModelImplCopyWith<_$QrModelImpl> get copyWith =>
      __$$QrModelImplCopyWithImpl<_$QrModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QrModelImplToJson(
      this,
    );
  }
}

abstract class _QrModel implements QrModel {
  const factory _QrModel(
      {@JsonKey(name: "provider") final String? provider,
      @JsonKey(name: "account") final String? account,
      @JsonKey(name: "amount") final String? amount,
      @JsonKey(name: "currency") final String? currency,
      @JsonKey(name: "merchant") final String? merchant,
      @JsonKey(name: "type") final String? type}) = _$QrModelImpl;

  factory _QrModel.fromJson(Map<String, dynamic> json) = _$QrModelImpl.fromJson;

  @override
  @JsonKey(name: "provider")
  String? get provider;
  @override
  @JsonKey(name: "account")
  String? get account;
  @override
  @JsonKey(name: "amount")
  String? get amount;
  @override
  @JsonKey(name: "currency")
  String? get currency;
  @override
  @JsonKey(name: "merchant")
  String? get merchant;
  @override
  @JsonKey(name: "type")
  String? get type;

  /// Create a copy of QrModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QrModelImplCopyWith<_$QrModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransferQrModel _$TransferQrModelFromJson(Map<String, dynamic> json) {
  return _TransferQrModel.fromJson(json);
}

/// @nodoc
mixin _$TransferQrModel {
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'wallet_id_to')
  int get walletIdTo => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;

  /// Serializes this TransferQrModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransferQrModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransferQrModelCopyWith<TransferQrModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferQrModelCopyWith<$Res> {
  factory $TransferQrModelCopyWith(
          TransferQrModel value, $Res Function(TransferQrModel) then) =
      _$TransferQrModelCopyWithImpl<$Res, TransferQrModel>;
  @useResult
  $Res call(
      {String type,
      @JsonKey(name: 'wallet_id_to') int walletIdTo,
      int amount,
      String currency,
      String note});
}

/// @nodoc
class _$TransferQrModelCopyWithImpl<$Res, $Val extends TransferQrModel>
    implements $TransferQrModelCopyWith<$Res> {
  _$TransferQrModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransferQrModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? walletIdTo = null,
    Object? amount = null,
    Object? currency = null,
    Object? note = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      walletIdTo: null == walletIdTo
          ? _value.walletIdTo
          : walletIdTo // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransferQrModelImplCopyWith<$Res>
    implements $TransferQrModelCopyWith<$Res> {
  factory _$$TransferQrModelImplCopyWith(_$TransferQrModelImpl value,
          $Res Function(_$TransferQrModelImpl) then) =
      __$$TransferQrModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      @JsonKey(name: 'wallet_id_to') int walletIdTo,
      int amount,
      String currency,
      String note});
}

/// @nodoc
class __$$TransferQrModelImplCopyWithImpl<$Res>
    extends _$TransferQrModelCopyWithImpl<$Res, _$TransferQrModelImpl>
    implements _$$TransferQrModelImplCopyWith<$Res> {
  __$$TransferQrModelImplCopyWithImpl(
      _$TransferQrModelImpl _value, $Res Function(_$TransferQrModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferQrModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? walletIdTo = null,
    Object? amount = null,
    Object? currency = null,
    Object? note = null,
  }) {
    return _then(_$TransferQrModelImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      walletIdTo: null == walletIdTo
          ? _value.walletIdTo
          : walletIdTo // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransferQrModelImpl implements _TransferQrModel {
  const _$TransferQrModelImpl(
      {required this.type,
      @JsonKey(name: 'wallet_id_to') required this.walletIdTo,
      required this.amount,
      required this.currency,
      required this.note});

  factory _$TransferQrModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransferQrModelImplFromJson(json);

  @override
  final String type;
  @override
  @JsonKey(name: 'wallet_id_to')
  final int walletIdTo;
  @override
  final int amount;
  @override
  final String currency;
  @override
  final String note;

  @override
  String toString() {
    return 'TransferQrModel(type: $type, walletIdTo: $walletIdTo, amount: $amount, currency: $currency, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferQrModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.walletIdTo, walletIdTo) ||
                other.walletIdTo == walletIdTo) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, walletIdTo, amount, currency, note);

  /// Create a copy of TransferQrModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferQrModelImplCopyWith<_$TransferQrModelImpl> get copyWith =>
      __$$TransferQrModelImplCopyWithImpl<_$TransferQrModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransferQrModelImplToJson(
      this,
    );
  }
}

abstract class _TransferQrModel implements TransferQrModel {
  const factory _TransferQrModel(
      {required final String type,
      @JsonKey(name: 'wallet_id_to') required final int walletIdTo,
      required final int amount,
      required final String currency,
      required final String note}) = _$TransferQrModelImpl;

  factory _TransferQrModel.fromJson(Map<String, dynamic> json) =
      _$TransferQrModelImpl.fromJson;

  @override
  String get type;
  @override
  @JsonKey(name: 'wallet_id_to')
  int get walletIdTo;
  @override
  int get amount;
  @override
  String get currency;
  @override
  String get note;

  /// Create a copy of TransferQrModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferQrModelImplCopyWith<_$TransferQrModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DynamicCpmModel _$DynamicCpmModelFromJson(Map<String, dynamic> json) {
  return _DynamicCpmModel.fromJson(json);
}

/// @nodoc
mixin _$DynamicCpmModel {
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "wallet_id_to")
  int? get walletIdTo => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  int? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "currency")
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: "note")
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this DynamicCpmModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DynamicCpmModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DynamicCpmModelCopyWith<DynamicCpmModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DynamicCpmModelCopyWith<$Res> {
  factory $DynamicCpmModelCopyWith(
          DynamicCpmModel value, $Res Function(DynamicCpmModel) then) =
      _$DynamicCpmModelCopyWithImpl<$Res, DynamicCpmModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "type") String? type,
      @JsonKey(name: "wallet_id_to") int? walletIdTo,
      @JsonKey(name: "amount") int? amount,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "note") String? note});
}

/// @nodoc
class _$DynamicCpmModelCopyWithImpl<$Res, $Val extends DynamicCpmModel>
    implements $DynamicCpmModelCopyWith<$Res> {
  _$DynamicCpmModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DynamicCpmModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? walletIdTo = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      walletIdTo: freezed == walletIdTo
          ? _value.walletIdTo
          : walletIdTo // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DynamicCpmModelImplCopyWith<$Res>
    implements $DynamicCpmModelCopyWith<$Res> {
  factory _$$DynamicCpmModelImplCopyWith(_$DynamicCpmModelImpl value,
          $Res Function(_$DynamicCpmModelImpl) then) =
      __$$DynamicCpmModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "type") String? type,
      @JsonKey(name: "wallet_id_to") int? walletIdTo,
      @JsonKey(name: "amount") int? amount,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "note") String? note});
}

/// @nodoc
class __$$DynamicCpmModelImplCopyWithImpl<$Res>
    extends _$DynamicCpmModelCopyWithImpl<$Res, _$DynamicCpmModelImpl>
    implements _$$DynamicCpmModelImplCopyWith<$Res> {
  __$$DynamicCpmModelImplCopyWithImpl(
      _$DynamicCpmModelImpl _value, $Res Function(_$DynamicCpmModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DynamicCpmModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? walletIdTo = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? note = freezed,
  }) {
    return _then(_$DynamicCpmModelImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      walletIdTo: freezed == walletIdTo
          ? _value.walletIdTo
          : walletIdTo // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DynamicCpmModelImpl implements _DynamicCpmModel {
  const _$DynamicCpmModelImpl(
      {@JsonKey(name: "type") this.type,
      @JsonKey(name: "wallet_id_to") this.walletIdTo,
      @JsonKey(name: "amount") this.amount,
      @JsonKey(name: "currency") this.currency,
      @JsonKey(name: "note") this.note});

  factory _$DynamicCpmModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DynamicCpmModelImplFromJson(json);

  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "wallet_id_to")
  final int? walletIdTo;
  @override
  @JsonKey(name: "amount")
  final int? amount;
  @override
  @JsonKey(name: "currency")
  final String? currency;
  @override
  @JsonKey(name: "note")
  final String? note;

  @override
  String toString() {
    return 'DynamicCpmModel(type: $type, walletIdTo: $walletIdTo, amount: $amount, currency: $currency, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DynamicCpmModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.walletIdTo, walletIdTo) ||
                other.walletIdTo == walletIdTo) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, walletIdTo, amount, currency, note);

  /// Create a copy of DynamicCpmModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DynamicCpmModelImplCopyWith<_$DynamicCpmModelImpl> get copyWith =>
      __$$DynamicCpmModelImplCopyWithImpl<_$DynamicCpmModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DynamicCpmModelImplToJson(
      this,
    );
  }
}

abstract class _DynamicCpmModel implements DynamicCpmModel {
  const factory _DynamicCpmModel(
      {@JsonKey(name: "type") final String? type,
      @JsonKey(name: "wallet_id_to") final int? walletIdTo,
      @JsonKey(name: "amount") final int? amount,
      @JsonKey(name: "currency") final String? currency,
      @JsonKey(name: "note") final String? note}) = _$DynamicCpmModelImpl;

  factory _DynamicCpmModel.fromJson(Map<String, dynamic> json) =
      _$DynamicCpmModelImpl.fromJson;

  @override
  @JsonKey(name: "type")
  String? get type;
  @override
  @JsonKey(name: "wallet_id_to")
  int? get walletIdTo;
  @override
  @JsonKey(name: "amount")
  int? get amount;
  @override
  @JsonKey(name: "currency")
  String? get currency;
  @override
  @JsonKey(name: "note")
  String? get note;

  /// Create a copy of DynamicCpmModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DynamicCpmModelImplCopyWith<_$DynamicCpmModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
