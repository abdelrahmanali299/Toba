import 'package:flutter/material.dart';
import 'package:quran/quran.dart';

class SurahContainer extends StatelessWidget {
  const SurahContainer(
      {super.key,
      required this.surahName,
      required this.surahNumber,
      required this.ontap});
  final String surahName;
  final int surahNumber;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: Color(0xffe3e3c6),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      surahName,
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '$surahNumber',
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('آياتها'),
                      Text('${getVerseCount(surahNumber)}'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
