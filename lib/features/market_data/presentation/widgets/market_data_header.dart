import 'package:flutter/material.dart';

/// Modern header widget for Market Data screen
class MarketDataHeader extends StatelessWidget {
  final bool isDark;
  final VoidCallback onSortPressed;

  const MarketDataHeader({super.key, required this.isDark, required this.onSortPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildTitle(), _buildSortButton(context)],
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(color: Color(0xFF00D9A3), shape: BoxShape.circle),
            ),
            const SizedBox(width: 8),
            Text(
              'Market Pulse',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : const Color(0xFF1A1D2E),
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          'Real-time crypto prices',
          style: TextStyle(
            fontSize: 14,
            color: isDark ? Colors.grey[400] : Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSortButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2139) : Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: .05), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: IconButton(
        icon: Icon(Icons.tune_rounded, color: isDark ? const Color(0xFF00D9A3) : const Color(0xFF6B4EFF), size: 24),
        onPressed: onSortPressed,
      ),
    );
  }
}
