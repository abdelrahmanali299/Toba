import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/quran.dart';
import 'package:toba2/Features/quran/presentation/cubits/page_color_cubit.dart';
import 'package:toba2/Features/quran/presentation/views/widgets/mark_button.dart';
import 'package:toba2/constants.dart';
import 'package:toba2/core/services/shard_pref_service.dart';
import 'package:toba2/core/utils/functions/get_surah_number.dart';
import 'package:toba2/core/utils/get_juz_name.dart';

class InformationContainer extends StatelessWidget {
  const InformationContainer({super.key, required this.currentPage});
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: SafeArea(
        child: Container(
          // width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: Color(0xff755033).withValues(alpha: .5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        getSurahNameArabic(getSurahFromPage(currentPage)),
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '$currentPage',
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        getJuzName(currentPage),
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => CustomColorDialog());
                      },
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                      )),
                  MarkButton(
                    onPressed: () {
                      ShardPrefService.setInt(markKey, currentPage);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(milliseconds: 500),
                        content: Text(
                          'تم الحفظ بنجاح',
                          style: TextStyle(fontSize: 18),
                          // textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                        ),
                      ));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomColorDialog extends StatefulWidget {
  const CustomColorDialog({super.key});
  static List<Color> colors = [
    Colors.white,
    Color(0xffe3e3c6),
    Colors.black,
  ];
  @override
  State<CustomColorDialog> createState() => _CustomColorDialogState();
}

class _CustomColorDialogState extends State<CustomColorDialog> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      alignment: Alignment.center,
      backgroundColor: Color(0xff755033).withValues(alpha: .5),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('اختر لون الصفحة',
                style: TextStyle(fontSize: 24, color: Colors.white)),
            Row(
                mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    List.generate(CustomColorDialog.colors.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      currentIndex = index;
                      context
                          .read<PageColorCubit>()
                          .changePageColor(currentIndex);
                      // currentIndex = ;
                      setState(() {});
                      // Navigator.pop(context);
                    },
                    child: ColorContainer(
                        color: CustomColorDialog.colors[index],
                        isSelected:
                            index == ShardPrefService.getInt(pageColor)),
                  );
                })),
          ],
        ),
      ),
    );
  }
}

class NonActiveColorContainer extends StatelessWidget {
  const NonActiveColorContainer({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class ActiveColorContainer extends StatelessWidget {
  const ActiveColorContainer({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Colors.orange,
        radius: 23,
        child: NonActiveColorContainer(color: color));
  }
}

class ColorContainer extends StatelessWidget {
  const ColorContainer({
    super.key,
    required this.color,
    this.isSelected,
  });
  final isSelected;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveColorContainer(color: color)
        : NonActiveColorContainer(color: color);
  }
}
