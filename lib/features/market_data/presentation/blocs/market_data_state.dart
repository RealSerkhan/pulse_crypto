part of 'market_data_cubit.dart';

@freezed
class MarketDataState with _$MarketDataState {
  const factory MarketDataState.initial() = _Initial;
  const factory MarketDataState.loading() = _Loading;
  const factory MarketDataState.loaded(List<MarketData> data) = _Loaded;
  const factory MarketDataState.error(String message) = _Error;
}
