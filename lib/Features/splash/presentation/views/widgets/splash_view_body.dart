import 'package:flutter/material.dart';
import 'package:toba2/Features/prayerTime/presentation/views/HomePage.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ColorFiltered(
      colorFilter: ColorFilter.mode(Color(0xffb59d83), BlendMode.darken),
      child: Image.asset(
        'assets/images/app_logo.jpg',
        fit: BoxFit.fill,
      ),
    ));
  }
}
