import 'package:flutter/material.dart';
import 'package:toba2/Features/azkar/presentation/models/zkr_model.dart';
import 'package:toba2/Features/azkar/presentation/views/widgets/zkr_page_view.dart';

class ZkrCard extends StatelessWidget {
  const ZkrCard({
    super.key,
    required this.zkrModel,
    required this.index,
  });
  final ZkrModel zkrModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ZkrPageView(index: index);
        }));
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      image: AssetImage(zkrModel.image), fit: BoxFit.fill),
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.rtl,
                  zkrModel.text,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
