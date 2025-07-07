import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toba2/Features/quran/presentation/cubits/page_color_cubit.dart';
import 'package:toba2/Features/quran/presentation/views/widgets/information_container.dart';
import 'package:toba2/Features/quran/presentation/views/widgets/one_page_of_surah.dart';
import 'package:toba2/constants.dart';
import 'package:toba2/core/services/shard_pref_service.dart';

class JuzPageView extends StatefulWidget {
  const JuzPageView(
      {super.key, required this.juzStartPage, required this.juzName});
  final int juzStartPage;
  final String juzName;
  @override
  State<JuzPageView> createState() => _JuzPageViewState();
}

class _JuzPageViewState extends State<JuzPageView> {
  late PageController pageController;
  late int currentPage = widget.juzStartPage;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.juzStartPage);
    pageController.addListener(() {
      currentPage = pageController.page!.round().toInt();
      setState(() {});
    });
  }

  bool active = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageColorCubit, PageColorState>(
        builder: (context, state) {
      return Scaffold(
        backgroundColor:
            CustomColorDialog.colors[ShardPrefService.getInt(pageColor)],
        body: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              reverse: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    active = !active;
                    setState(() {});
                  },
                  child: OnePageOfSurah(
                    pageNumebr: index,
                  ),
                );
              },
              itemCount: 605,
            ),
            active ? InformationContainer(currentPage: currentPage) : SizedBox()
          ],
        ),
      );
    });
  }
}
