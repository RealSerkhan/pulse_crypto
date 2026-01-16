import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:crypto_assessment/features/market_data/domain/repos/market_data_repo.dart';
import 'package:crypto_assessment/features/market_data/presentation/models/sort_option.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:crypto_assessment/base/domain/models/no_params.dart';
import 'package:crypto_assessment/features/market_data/domain/entities/market_data.dart';
import 'package:crypto_assessment/features/market_data/domain/use_cases/get_market_data_use_case.dart';

part 'market_data_state.dart';
part 'market_data_cubit.freezed.dart';

@lazySingleton
class MarketDataCubit extends Cubit<MarketDataState> {
  final GetMarketDataUseCase _getMarketDataUseCase;
  final MarketDataRepository _repository;
  StreamSubscription<MarketData>? _webSocketSubscription;

  SortOption? _currentSortOption;

  MarketDataCubit(this._getMarketDataUseCase, this._repository) : super(const MarketDataState.initial());

  List<MarketData> _allData = [];
  List<MarketData> get allData => _allData;

  void initWebSocket() {
    // Connect to WebSocket
    _repository.connectWebSocket();

    // Listen to real-time updates
    _webSocketSubscription = _repository.marketUpdates.listen((update) {
      _handleWebSocketUpdate(update);
    });
  }

  void _handleWebSocketUpdate(MarketData update) {
    // Update the market data in the list
    final index = _allData.indexWhere((item) => item.symbol == update.symbol);

    if (index != -1) {
      // Update existing item
      final existOne = _allData[index];
      _allData[index] = existOne.copyWith(
        price: update.price,
        change24h: update.change24h,
        changePercent24h: update.changePercent24h,
        volume24h: update.volume24h,
        marketCap: update.marketCap,
      );
    } else {
      // Add new item if it doesn't exist
      _allData.add(update);
    }
    emit(const _Loading());
    emit(_Loaded([..._allData]));
    // Re-apply sorting if needed
    if (_currentSortOption != null) {
      sort(_currentSortOption!);
    }
  }

  Future<void> loadMarketData({bool refresh = false}) async {
    if (!refresh && _allData.isNotEmpty) {
      emit(MarketDataState.loaded(_allData));
      return;
    }

    emit(const MarketDataState.loading());

    final result = await _getMarketDataUseCase(NoParams());

    result.fold((failure) => emit(MarketDataState.error(failure.errorMessage ?? 'Failed to load market data')), (data) {
      _allData = data;
      emit(MarketDataState.loaded(data));
    });
  }

  void searchMarketData(String query) {
    if (query.isEmpty) {
      emit(MarketDataState.loaded(_allData));
      return;
    }

    final filtered = _allData.where((data) => data.symbol.toLowerCase().contains(query.toLowerCase())).toList();
    emit(MarketDataState.loaded(filtered));
  }

  void sort(SortOption option) {
    _currentSortOption = option;
    switch (option) {
      case SortOption.priceAscending:
        _sortByPrice(ascending: true);
        break;
      case SortOption.priceDescending:
        _sortByPrice(ascending: false);
        break;
      case SortOption.changeAscending:
        _sortByChange(ascending: true);
        break;
      case SortOption.changeDescending:
        _sortByChange(ascending: false);
        break;
    }
  }

  void _sortByPrice({bool ascending = true}) {
    final sorted = List<MarketData>.from(_allData)
      ..sort((a, b) => ascending ? a.price.compareTo(b.price) : b.price.compareTo(a.price));
    emit(MarketDataState.loaded(sorted));
  }

  void _sortByChange({bool ascending = true}) {
    final sorted = List<MarketData>.from(_allData)..sort(
      (a, b) =>
          ascending ? (a.change24h ?? 0).compareTo(b.change24h ?? 0) : (b.change24h ?? 0).compareTo(a.change24h ?? 0),
    );
    emit(MarketDataState.loaded(sorted));
  }

  @override
  Future<void> close() {
    _webSocketSubscription?.cancel();
    _repository.disconnectWebSocket();
    return super.close();
  }
}
