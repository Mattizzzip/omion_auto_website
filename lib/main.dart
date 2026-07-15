import 'package:flutter/material.dart';

import 'features/omion_landing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OBDvia AI - Smart Car Scanning',
      debugShowCheckedModeBanner: false,
      home: OmionLanding(),
    );
  }
}
