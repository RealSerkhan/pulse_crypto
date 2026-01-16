import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:crypto_assessment/base/domain/errors/failure.dart';
import 'package:crypto_assessment/base/domain/models/no_params.dart';
import 'package:crypto_assessment/features/market_data/domain/entities/market_data.dart';
import 'package:crypto_assessment/features/market_data/domain/repos/market_data_repo.dart';

@lazySingleton
class GetMarketDataUseCase {
  final MarketDataRepository _repository;

  GetMarketDataUseCase(this._repository);

  Future<Either<Failure, List<MarketData>>> call(NoParams params) async {
    return await _repository.getMarketData();
  }
}
