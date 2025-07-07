import 'package:flutter/material.dart';

class Surahnamecontainer extends StatelessWidget {
  const Surahnamecontainer({super.key, required this.surahName});
  final String surahName;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Container(
          width: 200,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xff755033).withOpacity(.6),
          ),
          child: Center(
            child: Text(
              'سورة' + ' ' + '$surahName',
              style: TextStyle(fontSize: 36, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
