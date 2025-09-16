import 'package:flutter/material.dart';
import 'package:toba2/Features/quran/presentation/views/widgets/mark_button.dart';
import 'package:toba2/Features/quran/presentation/views/widgets/surahs_page_view.dart';
import 'package:toba2/constants.dart';
import 'package:toba2/core/services/shard_pref_service.dart';

customTabBar(String firstTab, String secondTab, BuildContext context) {
  return AppBar(
    leading: MarkButton(
      onPressed: () {
        int currentPage = ShardPrefService.getInt(markKey);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SurahsPageView(
            startPage: currentPage,
          );
        }));
      },
    ),
    backgroundColor: Color(0xff755033),
    bottom: TabBar(
        unselectedLabelColor: Colors.grey,
        labelStyle: TextStyle(color: Colors.white),
        indicatorColor: Colors.orange,
        dividerColor: Color(0xff755033),
        tabs: [
          Tab(
            child: Text(
              textDirection: TextDirection.rtl,
              secondTab,
              style: TextStyle(
                  // color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Tab(
            child: Text(
              textDirection: TextDirection.rtl,
              firstTab,
              style: TextStyle(
                  // color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          )
        ]),
  );
}
