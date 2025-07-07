import 'package:flutter/material.dart';
import 'package:toba2/Features/azkar/presentation/models/zkr_model.dart';
import 'package:toba2/Features/azkar/presentation/views/widgets/zkr_card.dart';

class AzkarPageBody extends StatelessWidget {
  const AzkarPageBody({super.key});
  final List<ZkrModel> zkrList = const [
    ZkrModel(
        text: 'أذكار الصباح والمساء',
        image: 'assets/images/sabah_and_massa_zkr.jpg',
        color: Colors.amberAccent),
    ZkrModel(
        text: "أذكار النوم",
        image: 'assets/images/sleep_image.jpg',
        color: Colors.grey),
    ZkrModel(
        text: "أذكار الاستيقاظ من النوم",
        image: 'assets/images/wake_up.jpg',
        color: Colors.blue),
    ZkrModel(
        text: "دعاء دخول الخلاء",
        image: 'assets/images/bathroom.jpg',
        color: Colors.blue),
    ZkrModel(
        text: "دعاء الخروج من الخلاء",
        image: 'assets/images/bathroom.jpg',
        color: Colors.blue),
    ZkrModel(
        text: "الذكر قبل الوضوء",
        image: 'assets/images/wudu.jpg',
        color: Colors.blue),
    ZkrModel(
        text: "الذكر بعد الفراغ من الوضوء",
        image: 'assets/images/wudu.jpg',
        color: Colors.blue),
    ZkrModel(
        text: "الذكر عند الخروج من المنزل",
        image: 'assets/images/home.jpg',
        color: Colors.blue),
    ZkrModel(
        text: "الذكر عند دخول المنزل",
        image: 'assets/images/home.jpg',
        color: Colors.blue),
    ZkrModel(
        text: "دعاء الذهاب إلى المسجد",
        image: 'assets/images/Mosque logo vector.jpg',
        color: Colors.blue),
    ZkrModel(
        text: "دعاء دخول المسجد",
        image: 'assets/images/Mosque logo vector.jpg',
        color: Colors.blue),
    ZkrModel(
        text: "دعاء الخروج من المسجد",
        image: 'assets/images/Mosque logo vector.jpg',
        color: Colors.blue),
  ];
  @override
  // int? indexx = 0;
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: zkrList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5),
            child: ZkrCard(
              index: index,
              zkrModel: zkrList[index],
            ),
          );
        });
  }
}
