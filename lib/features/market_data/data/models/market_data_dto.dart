import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:crypto_assessment/features/market_data/domain/entities/market_data.dart';

part 'market_data_dto.freezed.dart';
part 'market_data_dto.g.dart';

@freezed
class MarketDataDto with _$MarketDataDto {
  const factory MarketDataDto({
    /// Symbol of the cryptocurrency (e.g., "BTC", "ETH")
    required String symbol,

    /// Current price in USD
    required double price,

    /// 24-hour price change in USD
    required double? change24h,

    /// 24-hour price change in percentage
    required double? changePercent24h,

    /// 24-hour trading volume in USD
    // ignore: invalid_annotation_target
    @JsonKey(name: 'volume') double? volume24h,

    /// Market capitalization in USD
    double? marketCap,

    /// 24-hour high price in USD
    double? high24h,

    /// 24-hour low price in USD
    double? low24h,

    /// Last update timestamp (ISO 8601 string)
    String? lastUpdate,

    /// Circulating supply of the cryptocurrency
    double? circulatingSupply,

    /// Total supply of the cryptocurrency
    double? totalSupply,

    /// Maximum supply of the cryptocurrency
    double? maxSupply,
  }) = _MarketDataDto;

  factory MarketDataDto.fromJson(Map<String, dynamic> json) => _$MarketDataDtoFromJson(json);
  factory MarketDataDto.fromWebsocket(Map<String, dynamic> json) {
    return MarketDataDto(
      symbol: json['symbol'] as String,
      price: double.parse(json['price'].toString()),
      change24h: double.tryParse(json['change24h'].toString()),
      changePercent24h: double.tryParse(json['changePercent24h'].toString()),
      volume24h: json['volume'] != null ? double.tryParse(json['volume'].toString()) : null,
      marketCap: json['marketCap'] != null ? double.tryParse(json['marketCap'].toString()) : null,
      high24h: json['high24h'] != null ? double.tryParse(json['high24h'].toString()) : null,
      low24h: json['low24h'] != null ? double.tryParse(json['low24h'].toString()) : null,
      lastUpdate: json['lastUpdate'] as String?,
      circulatingSupply:
          json['circulatingSupply'] != null ? double.tryParse(json['circulatingSupply'].toString()) : null,
      totalSupply: json['totalSupply'] != null ? double.tryParse(json['totalSupply'].toString()) : null,
      maxSupply: json['maxSupply'] != null ? double.tryParse(json['maxSupply'].toString()) : null,
    );
  }
}

extension MarketDataDtoX on MarketDataDto {
  MarketData toDomain() {
    return MarketData(
      symbol: symbol,
      price: price,
      change24h: change24h,
      changePercent24h: changePercent24h,
      volume24h: volume24h,
      marketCap: marketCap,
      high24h: high24h,
      low24h: low24h,
      lastUpdate: lastUpdate,
      circulatingSupply: circulatingSupply,
      totalSupply: totalSupply,
      maxSupply: maxSupply,
    );
  }
}
