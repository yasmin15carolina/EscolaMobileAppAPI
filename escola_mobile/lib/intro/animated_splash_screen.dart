import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import '../views/home_view.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({Key? key});

  @override
  _AnimatedSplashScreenState createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> {
  @override
  void initState() {
    super.initState();
    timeDilation = 1.5;

    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (context) => const HomeView(),
    //     ),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TweenAnimationBuilder(
              duration: const Duration(seconds: 3),
              tween: Tween<double>(begin: 0.7, end: 1.0),
              builder: (context, double scale, child) {
                return Transform.scale(
                  scale: scale,
                  child: child,
                );
              },
              onEnd: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ),
                );
              },
              child: Image.asset('assets/images/vrsoftwarelogo.png'),
            ),
          ],
        ),
      ),
    );
  }
}
