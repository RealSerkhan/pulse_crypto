import 'package:crypto_assessment/base/di/di_entry_point.dart';
import 'package:crypto_assessment/features/market_data/presentation/models/sort_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_assessment/features/market_data/presentation/blocs/market_data_cubit.dart';
import 'package:crypto_assessment/features/market_data/presentation/widgets/market_data_header.dart';
import 'package:crypto_assessment/features/market_data/presentation/widgets/market_data_search_bar.dart';
import 'package:crypto_assessment/features/market_data/presentation/widgets/crypto_card.dart';
import 'package:crypto_assessment/features/market_data/presentation/widgets/empty_state_widget.dart';
import 'package:crypto_assessment/features/market_data/presentation/widgets/error_state_widget.dart';
import 'package:crypto_assessment/features/market_data/presentation/widgets/market_data_detail_sheet.dart';
import 'package:crypto_assessment/features/market_data/presentation/widgets/sort_menu_item.dart';

/// Modern Market Data Screen - Refactored with smaller widgets
class MarketDataScreen extends StatefulWidget {
  const MarketDataScreen({super.key});

  @override
  State<MarketDataScreen> createState() => _MarketDataScreenState();
}

class _MarketDataScreenState extends State<MarketDataScreen> {
  late MarketDataCubit _marketDataCubit;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _marketDataCubit = getIt<MarketDataCubit>();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _handleSort(SortOption sortOption) {
    _marketDataCubit.sort(sortOption);
  }

  void _showSortMenu(BuildContext context, bool isDark) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(MediaQuery.of(context).size.width - 20, kToolbarHeight + 20, 20, 0),
      items: SortMenuHelper.buildSortMenu(isDark: isDark),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: isDark ? const Color(0xFF1E2139) : Colors.white,
    ).then((value) {
      if (value != null) {
        _handleSort(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0A0E27) : const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          children: [
            MarketDataHeader(isDark: isDark, onSortPressed: () => _showSortMenu(context, isDark)),
            MarketDataSearchBar(
              controller: _searchController,
              isDark: isDark,
              onChanged: (value) => _marketDataCubit.searchMarketData(value),
              onClear: () {
                _searchController.clear();
                _marketDataCubit.searchMarketData('');
              },
            ),
            Expanded(
              child: BlocBuilder<MarketDataCubit, MarketDataState>(
                bloc: _marketDataCubit,
                builder: (context, state) {
                  return state.when(
                    initial: () => const Center(child: CircularProgressIndicator()),
                    loading: () => const Center(child: CircularProgressIndicator()),
                    loaded: (marketDataList) => _buildLoadedState(marketDataList, isDark),
                    error:
                        (message) => ErrorStateWidget(
                          message: message,
                          isDark: isDark,
                          onRetry: () => _marketDataCubit.loadMarketData(),
                        ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadedState(List marketDataList, bool isDark) {
    if (marketDataList.isEmpty) {
      return EmptyStateWidget(
        message:
            _searchController.text.isNotEmpty
                ? 'No results found for "${_searchController.text}"'
                : 'No market data available',
        icon: _searchController.text.isNotEmpty ? Icons.search_off_rounded : Icons.cloud_off_rounded,
        isDark: isDark,
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        _marketDataCubit.loadMarketData();
        await Future.delayed(const Duration(milliseconds: 500));
      },
      color: const Color(0xFF6B4EFF),
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
        itemCount: marketDataList.length,
        itemBuilder: (context, index) {
          final marketData = marketDataList[index];
          return CryptoCard(
            marketData: marketData,
            isDark: isDark,
            onTap: () => MarketDataDetailSheet.show(context, marketData, isDark),
          );
        },
      ),
    );
  }
}
