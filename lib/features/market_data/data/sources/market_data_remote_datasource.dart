import 'package:crypto_assessment/base/data/sources/base_remote_source.dart';
import 'package:injectable/injectable.dart';
import 'package:crypto_assessment/base/networking/http_client.dart';
import 'package:crypto_assessment/features/market_data/data/models/market_data_dto.dart';

abstract class MarketDataRemoteDataSource {
  Future<List<MarketDataDto>> getMarketData();
  Future<MarketDataDto> getMarketDataBySymbol(String symbol);
}

@LazySingleton(as: MarketDataRemoteDataSource)
class MarketDataRemoteDataSourceImpl extends BaseRemoteSource implements MarketDataRemoteDataSource {
  MarketDataRemoteDataSourceImpl(super._client);

  /// Get all market data
  /// Backend Endpoint: GET /api/market-data
  /// Backend Response: { success: true, data: [
  ///   {
  ///     "symbol": "BTC",
  ///     "price": 43250.50,
  ///     "change24h": 1250.75,
  ///     "changePercent24h": 2.98,
  ///     "volume": 28500000000,
  ///     "high24h": 43800.00,
  ///     "low24h": 42100.00,
  ///     "marketCap": 850000000000
  ///   },
  ///   ...
  /// ]}
  @override
  Future<List<MarketDataDto>> getMarketData() async {
    return request<List<MarketDataDto>>(
      method: HttpMethod.GET,
      endpoint: '/api/market-data',
      callId: 'getMarketData',
      serializer: (data) {
        final marketData = (data as List).map((item) => MarketDataDto.fromJson(item)).toList();
        return marketData;
      },
    );
  }

  /// Get market data for a specific symbol
  /// Backend Endpoint: GET /api/market-data/:symbol
  /// Backend Response: { success: true, data: { ... } }
  @override
  Future<MarketDataDto> getMarketDataBySymbol(String symbol) async {
    return request(
      method: HttpMethod.GET,
      endpoint: '/api/market-data/$symbol',
      callId: 'getMarketDataBySymbol',
      serializer: (data) {
        return MarketDataDto.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  /// Get historical data for a symbol (if needed for future enhancements)
  /// Backend Endpoint: GET /api/market-data/:symbol/history?timeframe=1h&limit=24
  /// Backend Response: { success: true, data: [...] }

  Future<List<MarketDataDto>> getMarketDataHistory({
    required String symbol,
    String timeframe = '1h',
    int limit = 24,
  }) async {
    return request(
      method: HttpMethod.GET,
      callId: 'getMarketDataHistory',
      endpoint: '/api/market-data/$symbol/history',
      queryParameters: {'timeframe': timeframe, 'limit': limit.toString()},
      serializer: (data) {
        return (data as List).map((item) => MarketDataDto.fromJson(item)).toList();
      },
    );
  }

  @override
  String get loggerTag => 'MarketDataRemoteDataSource';
}
