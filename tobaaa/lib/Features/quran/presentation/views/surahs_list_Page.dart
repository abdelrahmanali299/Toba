import 'package:flutter/material.dart';

import 'package:toba2/Features/quran/presentation/views/widgets/juz_list_view.dart';
import 'package:toba2/Features/quran/presentation/views/widgets/surahs_list.dart';
import 'package:toba2/core/utils/widgets/customTabBar.dart';

class SurahsListPage extends StatelessWidget {
  const SurahsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: customTabBar('سور', 'اجزاء', context),
        body: TabBarView(children: [JuzListView(), SurahList()]),
      ),
    );
  }
}
