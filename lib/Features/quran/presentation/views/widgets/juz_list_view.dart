import 'package:flutter/material.dart';
import 'package:quran/quran.dart';
import 'package:toba2/Features/quran/presentation/views/widgets/juz_container.dart';
import 'package:toba2/Features/quran/presentation/views/widgets/juz_page_view.dart';

class JuzListView extends StatelessWidget {
  const JuzListView({super.key});
  static List<String> juzsNames = [
    'الجزء الأول',
    'الجزء الثاني',
    'الجزء الثالث',
    'الجزء الرابع',
    'الجزء الخامس',
    'الجزء السادس',
    'الجزء السابع',
    'الجزء الثامن',
    'الجزء التاسع',
    'الجزء العاشر',
    'الجزء الحادي عشر',
    'الجزء الثاني عشر',
    'الجزء الثالث عشر',
    'الجزء الرابع عشر',
    'الجزء الخامس عشر',
    'الجزء السادس عشر',
    'الجزء السابع عشر',
    'الجزء الثامن عشر',
    'الجزء التاسع عشر',
    'الجزء العشرون',
    'الجزء الحادي والعشرون',
    'الجزء الثاني والعشرون',
    'الجزء الثالث والعشرون',
    'الجزء الرابع والعشرون',
    'الجزء الخامس والعشرون',
    'الجزء السادس والعشرون',
    'الجزء السابع والعشرون',
    'الجزء الثامن والعشرون',
    'الجزء التاسع والعشرون',
    'الجزء الثلاثون',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: totalJuzCount,
        itemBuilder: (context, index) {
          return JuzContainer(
            ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return JuzPageView(
                  juzName: juzsNames[index],
                  juzStartPage: getPageNumber(
                      getSurahAndVersesFromJuz(index + 1).keys.first,
                      getSurahAndVersesFromJuz(index + 1).values.first.first),
                );
              }));
            },
            startPage: getPageNumber(
                getSurahAndVersesFromJuz(index + 1).keys.first,
                getSurahAndVersesFromJuz(index + 1).values.first.first),
            juzName: juzsNames[index],
            juzNumber: index + 1,
          );
        });
  }
}
