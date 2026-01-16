import 'package:flutter/material.dart';

/// Modern search bar widget
class MarketDataSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final bool isDark;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const MarketDataSearchBar({
    super.key,
    required this.controller,
    required this.isDark,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E2139) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: .04), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: TextField(
          controller: controller,
          style: TextStyle(
            color: isDark ? Colors.white : const Color(0xFF1A1D2E),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: 'Search cryptocurrencies...',
            hintStyle: TextStyle(color: isDark ? Colors.grey[500] : Colors.grey[400], fontWeight: FontWeight.normal),
            prefixIcon: Icon(Icons.search_rounded, color: isDark ? Colors.grey[500] : Colors.grey[400], size: 22),
            suffixIcon:
                controller.text.isNotEmpty
                    ? IconButton(
                      icon: Icon(Icons.clear_rounded, color: isDark ? Colors.grey[500] : Colors.grey[400]),
                      onPressed: onClear,
                    )
                    : null,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
