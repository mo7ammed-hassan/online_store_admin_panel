import 'package:flutter/material.dart';

void showTopSnackBar(BuildContext? context, String message) {
  if (context == null) return; // Exit if context is null

  final overlay = Overlay.of(context); // Exit if overlay is not available

  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top + 16, // Adding some top padding
      left: 0,
      right: 0,
      child: Material(
        color: Colors.transparent,
        child: FractionallySizedBox(
          widthFactor: 3 / 6, // Set the width to 5/6 of the screen width
          child: Container(
            padding: const EdgeInsets.all(20), // 16 >> 20
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color:
                  Colors.black.withOpacity(0.4), // Semi-transparent background
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.info, color: Colors.white),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 3), () {
    if (overlayEntry.mounted) {
      overlayEntry.remove();
    }
  });
}
