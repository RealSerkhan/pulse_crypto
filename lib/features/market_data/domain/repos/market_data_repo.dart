import 'package:dartz/dartz.dart';
import 'package:crypto_assessment/base/domain/errors/failure.dart';
import 'package:crypto_assessment/features/market_data/domain/entities/market_data.dart';

abstract class MarketDataRepository {
  Future<Either<Failure, List<MarketData>>> getMarketData();
  Stream<MarketData> get marketUpdates;
  void connectWebSocket();
  void disconnectWebSocket();
}
