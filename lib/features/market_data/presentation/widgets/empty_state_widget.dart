import 'package:flutter/material.dart';

/// Empty state widget
class EmptyStateWidget extends StatelessWidget {
  final String message;
  final IconData icon;
  final bool isDark;

  const EmptyStateWidget({super.key, required this.message, required this.icon, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E2139) : Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Colors.black.withValues(alpha: .05), blurRadius: 20, offset: const Offset(0, 8)),
              ],
            ),
            child: Icon(icon, size: 48, color: isDark ? const Color(0xFF00D9A3) : const Color(0xFF6B4EFF)),
          ),
          const SizedBox(height: 24),
          Text(
            message,
            style: TextStyle(
              fontSize: 16,
              color: isDark ? Colors.grey[400] : Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
