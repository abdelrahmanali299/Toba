import 'package:flutter/material.dart';
import 'package:toba2/Features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffb59d83),
      body: SplashViewBody(),
    );
  }
}
