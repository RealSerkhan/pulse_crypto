// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MarketDataDto _$MarketDataDtoFromJson(Map<String, dynamic> json) {
  return _MarketDataDto.fromJson(json);
}

/// @nodoc
mixin _$MarketDataDto {
  /// Symbol of the cryptocurrency (e.g., "BTC", "ETH")
  String get symbol => throw _privateConstructorUsedError;

  /// Current price in USD
  double get price => throw _privateConstructorUsedError;

  /// 24-hour price change in USD
  double? get change24h => throw _privateConstructorUsedError;

  /// 24-hour price change in percentage
  double? get changePercent24h => throw _privateConstructorUsedError;

  /// 24-hour trading volume in USD
  @JsonKey(name: 'volume')
  double? get volume24h => throw _privateConstructorUsedError;

  /// Market capitalization in USD
  double? get marketCap => throw _privateConstructorUsedError;

  /// 24-hour high price in USD
  double? get high24h => throw _privateConstructorUsedError;

  /// 24-hour low price in USD
  double? get low24h => throw _privateConstructorUsedError;

  /// Last update timestamp (ISO 8601 string)
  String? get lastUpdate => throw _privateConstructorUsedError;

  /// Circulating supply of the cryptocurrency
  double? get circulatingSupply => throw _privateConstructorUsedError;

  /// Total supply of the cryptocurrency
  double? get totalSupply => throw _privateConstructorUsedError;

  /// Maximum supply of the cryptocurrency
  double? get maxSupply => throw _privateConstructorUsedError;

  /// Serializes this MarketDataDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MarketDataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MarketDataDtoCopyWith<MarketDataDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketDataDtoCopyWith<$Res> {
  factory $MarketDataDtoCopyWith(MarketDataDto value, $Res Function(MarketDataDto) then) =
      _$MarketDataDtoCopyWithImpl<$Res, MarketDataDto>;
  @useResult
  $Res call({
    String symbol,
    double price,
    double? change24h,
    double? changePercent24h,
    @JsonKey(name: 'volume') double? volume24h,
    double? marketCap,
    double? high24h,
    double? low24h,
    String? lastUpdate,
    double? circulatingSupply,
    double? totalSupply,
    double? maxSupply,
  });
}

/// @nodoc
class _$MarketDataDtoCopyWithImpl<$Res, $Val extends MarketDataDto> implements $MarketDataDtoCopyWith<$Res> {
  _$MarketDataDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MarketDataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? price = null,
    Object? change24h = freezed,
    Object? changePercent24h = freezed,
    Object? volume24h = freezed,
    Object? marketCap = freezed,
    Object? high24h = freezed,
    Object? low24h = freezed,
    Object? lastUpdate = freezed,
    Object? circulatingSupply = freezed,
    Object? totalSupply = freezed,
    Object? maxSupply = freezed,
  }) {
    return _then(
      _value.copyWith(
            symbol:
                null == symbol
                    ? _value.symbol
                    : symbol // ignore: cast_nullable_to_non_nullable
                        as String,
            price:
                null == price
                    ? _value.price
                    : price // ignore: cast_nullable_to_non_nullable
                        as double,
            change24h:
                freezed == change24h
                    ? _value.change24h
                    : change24h // ignore: cast_nullable_to_non_nullable
                        as double?,
            changePercent24h:
                freezed == changePercent24h
                    ? _value.changePercent24h
                    : changePercent24h // ignore: cast_nullable_to_non_nullable
                        as double?,
            volume24h:
                freezed == volume24h
                    ? _value.volume24h
                    : volume24h // ignore: cast_nullable_to_non_nullable
                        as double?,
            marketCap:
                freezed == marketCap
                    ? _value.marketCap
                    : marketCap // ignore: cast_nullable_to_non_nullable
                        as double?,
            high24h:
                freezed == high24h
                    ? _value.high24h
                    : high24h // ignore: cast_nullable_to_non_nullable
                        as double?,
            low24h:
                freezed == low24h
                    ? _value.low24h
                    : low24h // ignore: cast_nullable_to_non_nullable
                        as double?,
            lastUpdate:
                freezed == lastUpdate
                    ? _value.lastUpdate
                    : lastUpdate // ignore: cast_nullable_to_non_nullable
                        as String?,
            circulatingSupply:
                freezed == circulatingSupply
                    ? _value.circulatingSupply
                    : circulatingSupply // ignore: cast_nullable_to_non_nullable
                        as double?,
            totalSupply:
                freezed == totalSupply
                    ? _value.totalSupply
                    : totalSupply // ignore: cast_nullable_to_non_nullable
                        as double?,
            maxSupply:
                freezed == maxSupply
                    ? _value.maxSupply
                    : maxSupply // ignore: cast_nullable_to_non_nullable
                        as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MarketDataDtoImplCopyWith<$Res> implements $MarketDataDtoCopyWith<$Res> {
  factory _$$MarketDataDtoImplCopyWith(_$MarketDataDtoImpl value, $Res Function(_$MarketDataDtoImpl) then) =
      __$$MarketDataDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String symbol,
    double price,
    double? change24h,
    double? changePercent24h,
    @JsonKey(name: 'volume') double? volume24h,
    double? marketCap,
    double? high24h,
    double? low24h,
    String? lastUpdate,
    double? circulatingSupply,
    double? totalSupply,
    double? maxSupply,
  });
}

/// @nodoc
class __$$MarketDataDtoImplCopyWithImpl<$Res> extends _$MarketDataDtoCopyWithImpl<$Res, _$MarketDataDtoImpl>
    implements _$$MarketDataDtoImplCopyWith<$Res> {
  __$$MarketDataDtoImplCopyWithImpl(_$MarketDataDtoImpl _value, $Res Function(_$MarketDataDtoImpl) _then)
    : super(_value, _then);

  /// Create a copy of MarketDataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? price = null,
    Object? change24h = freezed,
    Object? changePercent24h = freezed,
    Object? volume24h = freezed,
    Object? marketCap = freezed,
    Object? high24h = freezed,
    Object? low24h = freezed,
    Object? lastUpdate = freezed,
    Object? circulatingSupply = freezed,
    Object? totalSupply = freezed,
    Object? maxSupply = freezed,
  }) {
    return _then(
      _$MarketDataDtoImpl(
        symbol:
            null == symbol
                ? _value.symbol
                : symbol // ignore: cast_nullable_to_non_nullable
                    as String,
        price:
            null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                    as double,
        change24h:
            freezed == change24h
                ? _value.change24h
                : change24h // ignore: cast_nullable_to_non_nullable
                    as double?,
        changePercent24h:
            freezed == changePercent24h
                ? _value.changePercent24h
                : changePercent24h // ignore: cast_nullable_to_non_nullable
                    as double?,
        volume24h:
            freezed == volume24h
                ? _value.volume24h
                : volume24h // ignore: cast_nullable_to_non_nullable
                    as double?,
        marketCap:
            freezed == marketCap
                ? _value.marketCap
                : marketCap // ignore: cast_nullable_to_non_nullable
                    as double?,
        high24h:
            freezed == high24h
                ? _value.high24h
                : high24h // ignore: cast_nullable_to_non_nullable
                    as double?,
        low24h:
            freezed == low24h
                ? _value.low24h
                : low24h // ignore: cast_nullable_to_non_nullable
                    as double?,
        lastUpdate:
            freezed == lastUpdate
                ? _value.lastUpdate
                : lastUpdate // ignore: cast_nullable_to_non_nullable
                    as String?,
        circulatingSupply:
            freezed == circulatingSupply
                ? _value.circulatingSupply
                : circulatingSupply // ignore: cast_nullable_to_non_nullable
                    as double?,
        totalSupply:
            freezed == totalSupply
                ? _value.totalSupply
                : totalSupply // ignore: cast_nullable_to_non_nullable
                    as double?,
        maxSupply:
            freezed == maxSupply
                ? _value.maxSupply
                : maxSupply // ignore: cast_nullable_to_non_nullable
                    as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MarketDataDtoImpl implements _MarketDataDto {
  const _$MarketDataDtoImpl({
    required this.symbol,
    required this.price,
    required this.change24h,
    required this.changePercent24h,
    @JsonKey(name: 'volume') this.volume24h,
    this.marketCap,
    this.high24h,
    this.low24h,
    this.lastUpdate,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
  });

  factory _$MarketDataDtoImpl.fromJson(Map<String, dynamic> json) => _$$MarketDataDtoImplFromJson(json);

  /// Symbol of the cryptocurrency (e.g., "BTC", "ETH")
  @override
  final String symbol;

  /// Current price in USD
  @override
  final double price;

  /// 24-hour price change in USD
  @override
  final double? change24h;

  /// 24-hour price change in percentage
  @override
  final double? changePercent24h;

  /// 24-hour trading volume in USD
  @override
  @JsonKey(name: 'volume')
  final double? volume24h;

  /// Market capitalization in USD
  @override
  final double? marketCap;

  /// 24-hour high price in USD
  @override
  final double? high24h;

  /// 24-hour low price in USD
  @override
  final double? low24h;

  /// Last update timestamp (ISO 8601 string)
  @override
  final String? lastUpdate;

  /// Circulating supply of the cryptocurrency
  @override
  final double? circulatingSupply;

  /// Total supply of the cryptocurrency
  @override
  final double? totalSupply;

  /// Maximum supply of the cryptocurrency
  @override
  final double? maxSupply;

  @override
  String toString() {
    return 'MarketDataDto(symbol: $symbol, price: $price, change24h: $change24h, changePercent24h: $changePercent24h, volume24h: $volume24h, marketCap: $marketCap, high24h: $high24h, low24h: $low24h, lastUpdate: $lastUpdate, circulatingSupply: $circulatingSupply, totalSupply: $totalSupply, maxSupply: $maxSupply)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketDataDtoImpl &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.change24h, change24h) || other.change24h == change24h) &&
            (identical(other.changePercent24h, changePercent24h) || other.changePercent24h == changePercent24h) &&
            (identical(other.volume24h, volume24h) || other.volume24h == volume24h) &&
            (identical(other.marketCap, marketCap) || other.marketCap == marketCap) &&
            (identical(other.high24h, high24h) || other.high24h == high24h) &&
            (identical(other.low24h, low24h) || other.low24h == low24h) &&
            (identical(other.lastUpdate, lastUpdate) || other.lastUpdate == lastUpdate) &&
            (identical(other.circulatingSupply, circulatingSupply) || other.circulatingSupply == circulatingSupply) &&
            (identical(other.totalSupply, totalSupply) || other.totalSupply == totalSupply) &&
            (identical(other.maxSupply, maxSupply) || other.maxSupply == maxSupply));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    symbol,
    price,
    change24h,
    changePercent24h,
    volume24h,
    marketCap,
    high24h,
    low24h,
    lastUpdate,
    circulatingSupply,
    totalSupply,
    maxSupply,
  );

  /// Create a copy of MarketDataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketDataDtoImplCopyWith<_$MarketDataDtoImpl> get copyWith =>
      __$$MarketDataDtoImplCopyWithImpl<_$MarketDataDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarketDataDtoImplToJson(this);
  }
}

abstract class _MarketDataDto implements MarketDataDto {
  const factory _MarketDataDto({
    required final String symbol,
    required final double price,
    required final double? change24h,
    required final double? changePercent24h,
    @JsonKey(name: 'volume') final double? volume24h,
    final double? marketCap,
    final double? high24h,
    final double? low24h,
    final String? lastUpdate,
    final double? circulatingSupply,
    final double? totalSupply,
    final double? maxSupply,
  }) = _$MarketDataDtoImpl;

  factory _MarketDataDto.fromJson(Map<String, dynamic> json) = _$MarketDataDtoImpl.fromJson;

  /// Symbol of the cryptocurrency (e.g., "BTC", "ETH")
  @override
  String get symbol;

  /// Current price in USD
  @override
  double get price;

  /// 24-hour price change in USD
  @override
  double? get change24h;

  /// 24-hour price change in percentage
  @override
  double? get changePercent24h;

  /// 24-hour trading volume in USD
  @override
  @JsonKey(name: 'volume')
  double? get volume24h;

  /// Market capitalization in USD
  @override
  double? get marketCap;

  /// 24-hour high price in USD
  @override
  double? get high24h;

  /// 24-hour low price in USD
  @override
  double? get low24h;

  /// Last update timestamp (ISO 8601 string)
  @override
  String? get lastUpdate;

  /// Circulating supply of the cryptocurrency
  @override
  double? get circulatingSupply;

  /// Total supply of the cryptocurrency
  @override
  double? get totalSupply;

  /// Maximum supply of the cryptocurrency
  @override
  double? get maxSupply;

  /// Create a copy of MarketDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarketDataDtoImplCopyWith<_$MarketDataDtoImpl> get copyWith => throw _privateConstructorUsedError;
}
