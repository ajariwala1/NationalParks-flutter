import 'package:flutter/material.dart';
import 'package:nationalparks/providers/nationalparks_provider.dart';
import 'package:provider/provider.dart';
import 'screens/intro_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => NationalParksProvider(),
      child: NationalParksApp(),
    ),
  );
}

class NationalParksApp extends StatelessWidget {
  const NationalParksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'National Parks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
      ),
      home: IntroScreen()
    );
  }
}