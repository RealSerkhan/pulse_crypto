import 'package:crypto_assessment/base/di/di_entry_point.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_assessment/features/market_data/domain/entities/market_data.dart';
import 'package:crypto_assessment/features/market_data/presentation/blocs/market_data_cubit.dart';
import 'package:crypto_assessment/base/utils/number_formatters.dart';

/// Market data detail bottom sheet
class MarketDataDetailSheet extends StatelessWidget {
  final MarketData marketData;
  final bool isDark;

  const MarketDataDetailSheet({super.key, required this.marketData, required this.isDark});

  static void show(BuildContext context, MarketData marketData, bool isDark) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => MarketDataDetailSheet(marketData: marketData, isDark: isDark),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketDataCubit, MarketDataState>(
      bloc: getIt<MarketDataCubit>(),
      builder: (context, state) {
        // Get the latest data for this symbol from the cubit
        MarketData currentData = marketData;
        state.whenOrNull(
          loaded: (data) {
            final updated = data.firstWhere((item) => item.symbol == marketData.symbol, orElse: () => marketData);
            currentData = updated;
          },
        );

        return Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E2139) : Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              _buildHandle(),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(currentData),
                    const SizedBox(height: 24),
                    _buildDetailRow(
                      '24h Change',
                      currentData.change24h != null ? NumberFormatters.formatCurrency(currentData.change24h!) : 'N/A',
                    ),
                    _buildDetailRow(
                      '24h Change %',
                      currentData.changePercent24h != null
                          ? '${NumberFormatters.formatPercent(currentData.changePercent24h!)}%'
                          : 'N/A',
                    ),
                    if (currentData.volume24h != null)
                      _buildDetailRow('24h Volume', NumberFormatters.formatCurrency(currentData.volume24h!)),
                    if (currentData.marketCap != null)
                      _buildDetailRow('Market Cap', NumberFormatters.formatCurrency(currentData.marketCap!)),
                    if (currentData.high24h != null)
                      _buildDetailRow('24h High', NumberFormatters.formatCurrency(currentData.high24h!)),
                    if (currentData.low24h != null)
                      _buildDetailRow('24h Low', NumberFormatters.formatCurrency(currentData.low24h!)),
                    const SizedBox(height: 16),
                    _buildCloseButton(context),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHandle() {
    return Container(
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[700] : Colors.grey[300],
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildHeader(MarketData data) {
    return Row(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                data.isPositiveChange ? const Color(0xFF00D9A3) : const Color(0xFFFF6B6B),
                data.isPositiveChange ? const Color(0xFF00A67E) : const Color(0xFFFF4757),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              data.symbol.substring(0, 1),
              style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.symbol,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : const Color(0xFF1A1D2E),
                ),
              ),
              Text(
                NumberFormatters.formatCurrency(data.price),
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF1A1D2E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6B4EFF),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        child: const Text('Close', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
