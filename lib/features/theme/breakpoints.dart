import 'package:flutter/material.dart';

const double kMobileBreakpoint = 900;

bool isMobileLayout(BuildContext context) {
  return MediaQuery.sizeOf(context).width <= kMobileBreakpoint;
}
