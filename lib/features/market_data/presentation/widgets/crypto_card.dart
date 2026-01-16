import 'package:flutter/material.dart';
import 'package:crypto_assessment/features/market_data/domain/entities/market_data.dart';
import 'package:crypto_assessment/base/utils/number_formatters.dart';

/// Modern crypto card widget
class CryptoCard extends StatelessWidget {
  final MarketData marketData;
  final bool isDark;
  final VoidCallback onTap;

  const CryptoCard({super.key, required this.marketData, required this.isDark, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isPositive = marketData.isPositiveChange;
    final changeColor = isPositive ? const Color(0xFF00D9A3) : const Color(0xFFFF6B6B);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2139) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: .04), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _buildIcon(isPositive),
                const SizedBox(width: 16),
                _buildInfo(),
                _buildPriceAndChange(changeColor, isPositive),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(bool isPositive) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            isPositive ? const Color(0xFF00D9A3) : const Color(0xFFFF6B6B),
            isPositive ? const Color(0xFF00A67E) : const Color(0xFFFF4757),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          marketData.symbol.substring(0, 1),
          style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            marketData.symbol,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF1A1D2E),
            ),
          ),
          if (marketData.volume24h != null) ...[
            const SizedBox(height: 4),
            Text(
              'Vol: ${NumberFormatters.formatCompactCurrency(marketData.volume24h!)}',
              style: TextStyle(
                fontSize: 13,
                color: isDark ? Colors.grey[500] : Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPriceAndChange(Color changeColor, bool isPositive) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          NumberFormatters.formatCurrency(marketData.price),
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : const Color(0xFF1A1D2E),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(color: changeColor.withValues(alpha: .15), borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(isPositive ? Icons.trending_up_rounded : Icons.trending_down_rounded, size: 14, color: changeColor),
              const SizedBox(width: 4),
              Text(
                marketData.changePercent24h != null
                    ? '${NumberFormatters.formatPercent(marketData.changePercent24h!)}%'
                    : 'N/A ',
                style: TextStyle(color: changeColor, fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
