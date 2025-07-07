import 'package:flutter/material.dart';

class Customappbar extends StatelessWidget {
  const Customappbar({super.key, required this.surahName});
  final String surahName;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width * .5,
      decoration: BoxDecoration(
        color: Color(0xff755033).withOpacity(.4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          surahName,
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
