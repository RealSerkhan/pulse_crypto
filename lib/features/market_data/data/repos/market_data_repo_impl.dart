import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:crypto_assessment/base/data/repos/base_repo_impl.dart';
import 'package:crypto_assessment/base/domain/errors/failure.dart';
import 'package:crypto_assessment/features/market_data/data/models/market_data_dto.dart';
import 'package:crypto_assessment/features/market_data/data/sources/market_data_remote_datasource.dart';
import 'package:crypto_assessment/features/market_data/data/sources/market_data_websocket_datasource.dart';
import 'package:crypto_assessment/features/market_data/domain/entities/market_data.dart';
import 'package:crypto_assessment/features/market_data/domain/repos/market_data_repo.dart';

@LazySingleton(as: MarketDataRepository)
class MarketDataRepositoryImpl extends BaseRepositoryImpl implements MarketDataRepository {
  final MarketDataRemoteDataSource _remoteDataSource;
  final MarketDataWebSocketDataSource _webSocketDataSource;

  MarketDataRepositoryImpl(this._remoteDataSource, this._webSocketDataSource, Logger logger) : super(logger);

  @override
  Future<Either<Failure, List<MarketData>>> getMarketData() async {
    return request(() async {
      final dtoList = await _remoteDataSource.getMarketData();
      return dtoList.map((dto) => dto.toDomain()).toList();
    });
  }

  @override
  Stream<MarketData> get marketUpdates {
    return _webSocketDataSource.marketUpdates.map((dto) => dto.toDomain());
  }

  @override
  void connectWebSocket() {
    _webSocketDataSource.connect();
  }

  @override
  void disconnectWebSocket() {
    _webSocketDataSource.disconnect();
  }
}
