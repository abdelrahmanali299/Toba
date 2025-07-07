import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:toba2/Features/azkar/presentation/views/azkar_page.dart';
import 'package:toba2/Features/prayerTime/presentation/manager/cubits/prayercubit/prayertimes_cubit.dart';
import 'package:toba2/Features/prayerTime/presentation/manager/cubits/prayercubit/prayertimes_states.dart';
import 'package:toba2/Features/prayerTime/presentation/views/PrayerTimesPage.dart';
import 'package:toba2/Features/quran/presentation/views/surahs_list_Page.dart';
import 'package:toba2/Features/tasbeeh/presentation/views/tsbeehPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int index = 3;

  List<Widget> pages = [
    Tsbeehpage(),
    AzkarPage(),
    SurahsListPage(),
    PrayerTimesPage(),
  ];

  @override
  void initState() {
    BlocProvider.of<PrayertimesCubit>(context).getPrayerTimes();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xff755033),
        backgroundColor: Color(0xffe3e3c6),
        index: 3,
        items: [
          Icon(
            FlutterIslamicIcons.solidTasbihHand,
            color: Colors.white,
          ),
          Icon(
            FlutterIslamicIcons.allah,
            color: Colors.white,
          ),
          Icon(
            FlutterIslamicIcons.quran2,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            color: Colors.white,
          ),
        ],
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
      body: index == 3
          ? BlocBuilder<PrayertimesCubit, PrayertimesStates>(
              builder: (context, state) {
                if (state is LoadingStatePrayerTimes) {
                  return Skeletonizer(child: pages[index]);
                } else {
                  return pages[index];
                }
              },
            )
          : pages[index],
    );
  }
}
