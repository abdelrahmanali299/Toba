import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:toba2/Features/azkar/presentation/models/one_zkr_model.dart';

class Zkr extends StatefulWidget {
  const Zkr(
      {super.key, required this.oneZkrModel, required this.pageController});
  final OneZkrModel oneZkrModel;
  final PageController pageController;
  @override
  State<Zkr> createState() => _ZkrState();
}

class _ZkrState extends State<Zkr> {
  double value = 0;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          value += 1 / widget.oneZkrModel.count;
          count++;
        });
        if (count == widget.oneZkrModel.count) {
          widget.pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
          setState(() {
            value = 0;
            count = 0;
          });
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: SingleChildScrollView(
                  child: Text(
                    widget.oneZkrModel.text,
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 18,
                      height: 2.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          widget.oneZkrModel.count > 1
              ? Expanded(
                  child:
                      PieChart(PieChartData(centerSpaceRadius: 30, sections: [
                    PieChartSectionData(
                      radius: 10,
                      title: '$count/${widget.oneZkrModel.count}',
                      titlePositionPercentageOffset: -3,
                      titleStyle: TextStyle(fontSize: 18),
                      value: 1 - value,
                      color: Colors.white,
                    ),
                    PieChartSectionData(
                        radius: 10,
                        showTitle: false,
                        value: value,
                        color: Color(0xff755033)),
                  ])),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
