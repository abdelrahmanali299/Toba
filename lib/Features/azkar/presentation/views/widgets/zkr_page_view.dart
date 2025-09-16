import 'package:flutter/material.dart';
import 'package:toba2/Features/azkar/presentation/views/widgets/zkr_page_view_body.dart';
import 'package:toba2/Features/azkar/service/load_azkar.dart';

class ZkrPageView extends StatelessWidget {
  const ZkrPageView({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadAzkar(index),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return zkrPageViewBody(
              snapshot: snapshot,
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Color(0xff755033),
                ),
              ),
            );
          }
        });
  }
}
