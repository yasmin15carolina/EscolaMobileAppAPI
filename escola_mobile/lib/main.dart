import 'package:escola_mobile/intro/animated_splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: 'VR Escola Mobile',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          useMaterial3: false,
        ),
        home: AnimatedSplashScreen());
  }
}
