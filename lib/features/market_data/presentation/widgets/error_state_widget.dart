import 'package:flutter/material.dart';

/// Error state widget with retry button
class ErrorStateWidget extends StatelessWidget {
  final String message;
  final bool isDark;
  final VoidCallback onRetry;

  const ErrorStateWidget({super.key, required this.message, required this.isDark, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
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
              child: const Icon(Icons.error_outline_rounded, size: 56, color: Color(0xFFFF6B6B)),
            ),
            const SizedBox(height: 24),
            Text(
              'Oops!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : const Color(0xFF1A1D2E),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: isDark ? Colors.grey[400] : Colors.grey[600], height: 1.5),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6B4EFF),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Try Again', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}
