
import 'dart:io';

import 'package:dailypay/providers/theme_provider.dart';
import 'package:dailypay/screens/onboarding/pager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/theme/theme.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_)=>ThemeProvider()),
      ],
      child: MyApp(),
    ));
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider t = ThemeProvider();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DailiPay',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).theme??darkTheme,
      home: OnboardPager(
        
      ),
    );
  }
}




class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
