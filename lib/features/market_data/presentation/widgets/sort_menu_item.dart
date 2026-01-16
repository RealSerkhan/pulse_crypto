import 'package:flutter/material.dart';
import 'package:crypto_assessment/features/market_data/presentation/models/sort_option.dart';

/// Helper class to build sort menu items
class SortMenuHelper {
  static PopupMenuItem<SortOption> buildMenuItem({
    required SortOption sortOption,
    required IconData icon,
    required bool isDark,
  }) {
    return PopupMenuItem<SortOption>(
      value: sortOption,
      child: Row(
        children: [
          Icon(icon, size: 20, color: isDark ? const Color(0xFF00D9A3) : const Color(0xFF6B4EFF)),
          const SizedBox(width: 12),
          Text(
            sortOption.label,
            style: TextStyle(color: isDark ? Colors.white : const Color(0xFF1A1D2E), fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  static List<PopupMenuEntry<SortOption>> buildSortMenu({required bool isDark}) {
    return [
      buildMenuItem(sortOption: SortOption.priceAscending, icon: Icons.arrow_upward_rounded, isDark: isDark),
      buildMenuItem(sortOption: SortOption.priceDescending, icon: Icons.arrow_downward_rounded, isDark: isDark),
      buildMenuItem(sortOption: SortOption.changeAscending, icon: Icons.trending_up_rounded, isDark: isDark),
      buildMenuItem(sortOption: SortOption.changeDescending, icon: Icons.trending_down_rounded, isDark: isDark),
    ];
  }
}
