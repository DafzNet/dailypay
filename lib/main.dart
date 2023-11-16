
import 'package:dailypay/screens/onboarding/pager.dart';
import 'package:flutter/material.dart';
import 'utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DailiPay',
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: OnboardPager(
        
      ),
    );
  }
}

