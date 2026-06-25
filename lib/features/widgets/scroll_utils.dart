import 'package:flutter/material.dart';

void scrollToKey(
  GlobalKey key, {
  Duration duration = const Duration(milliseconds: 800),
  Curve curve = Curves.easeInOutCubic,
  double alignment = 0.0,
}) {
  final context = key.currentContext;
  if (context != null) {
    Scrollable.ensureVisible(
      context,
      duration: duration,
      curve: curve,
      alignment: alignment,
    );
  }
}

void scrollToTop(ScrollController controller) {
  controller.animateTo(
    0,
    duration: const Duration(milliseconds: 800),
    curve: Curves.easeInOutCubic,
  );
}
