// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MarketDataDtoImpl _$$MarketDataDtoImplFromJson(Map<String, dynamic> json) =>
    _$MarketDataDtoImpl(
      symbol: json['symbol'] as String,
      price: (json['price'] as num).toDouble(),
      change24h: (json['change24h'] as num?)?.toDouble(),
      changePercent24h: (json['changePercent24h'] as num?)?.toDouble(),
      volume24h: (json['volume'] as num?)?.toDouble(),
      marketCap: (json['marketCap'] as num?)?.toDouble(),
      high24h: (json['high24h'] as num?)?.toDouble(),
      low24h: (json['low24h'] as num?)?.toDouble(),
      lastUpdate: json['lastUpdate'] as String?,
      circulatingSupply: (json['circulatingSupply'] as num?)?.toDouble(),
      totalSupply: (json['totalSupply'] as num?)?.toDouble(),
      maxSupply: (json['maxSupply'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$MarketDataDtoImplToJson(_$MarketDataDtoImpl instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'price': instance.price,
      'change24h': instance.change24h,
      'changePercent24h': instance.changePercent24h,
      'volume': instance.volume24h,
      'marketCap': instance.marketCap,
      'high24h': instance.high24h,
      'low24h': instance.low24h,
      'lastUpdate': instance.lastUpdate,
      'circulatingSupply': instance.circulatingSupply,
      'totalSupply': instance.totalSupply,
      'maxSupply': instance.maxSupply,
    };
