import 'package:flutter/material.dart';
import 'package:toba2/constants.dart';
import 'package:toba2/core/services/shard_pref_service.dart';

class OnePageOfSurah extends StatefulWidget {
  const OnePageOfSurah({super.key, required this.pageNumebr});
  final int pageNumebr;

  @override
  State<OnePageOfSurah> createState() => _OnePageOfSurahState();
}

class _OnePageOfSurahState extends State<OnePageOfSurah> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return NonActiveOnePageOfSurah(pageNumebr: widget.pageNumebr);
  }
}

class NonActiveOnePageOfSurah extends StatelessWidget {
  const NonActiveOnePageOfSurah({super.key, required this.pageNumebr});
  final int pageNumebr;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ColorFiltered(
              colorFilter: ShardPrefService.getInt(pageColor) == 2
                  ? const ColorFilter.matrix(<double>[
                      -1, 0, 0, 0, 255, // R
                      0, -1, 0, 0, 255, // G
                      0, 0, -1, 0, 255, // B
                      0, 0, 0, 1, 0, // A
                    ])
                  : const ColorFilter.mode(
                      Colors.transparent, BlendMode.multiply),
              child: Image(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                image: AssetImage('assets/quran-images/$pageNumebr.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            '$pageNumebr',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ShardPrefService.getInt(pageColor) == 2
                    ? Colors.white
                    : Colors.black),
          ),
        ],
      ),
    );
  }
}

class ActiveOnePageOfSurah extends StatelessWidget {
  const ActiveOnePageOfSurah(
      {super.key, required this.pageNumebr, this.surahName, this.juzName});
  final int pageNumebr;
  final surahName;
  final juzName;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NonActiveOnePageOfSurah(pageNumebr: pageNumebr),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Container(
            // width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 25),
            color: Color(0xff755033).withValues(alpha: .5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '$surahName',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '$pageNumebr',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '$juzName',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
