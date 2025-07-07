import 'package:flutter/material.dart';
import 'package:toba2/Features/tasbeeh/presentation/views/widgets/tsbeeh_item.dart';

class ListTasbeehItems extends StatelessWidget {
  ListTasbeehItems({super.key});
  final List<String> azkar = [
    'استغفر الله',
    'لا حول ولا قوة الا بالله',
    'الله أكبر',
    'لا اله الا الله',
    'الحمد لله',
    'سبحان الله'
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        reverse: true,
        itemCount: azkar.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TsbeehItem(tsbeehText: azkar[azkar.length - 1 - index]),
          );
        });
  }
}
