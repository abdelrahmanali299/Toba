import 'package:flutter/material.dart';
import 'package:quran/quran.dart';
import 'package:toba2/Features/quran/presentation/views/widgets/surah_container.dart';
import 'package:toba2/Features/quran/presentation/views/widgets/surahs_page_view.dart';

class SurahList extends StatelessWidget {
  const SurahList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: totalSurahCount,
        itemBuilder: (context, index) {
          return SurahContainer(
              surahName: getSurahNameArabic(index + 1),
              surahNumber: index + 1,
              ontap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SurahsPageView(
                    surahNumber: index + 1,
                  );
                }));
              });
        });
  }
}
