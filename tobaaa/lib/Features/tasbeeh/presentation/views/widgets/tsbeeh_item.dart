import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toba2/Features/tasbeeh/presentation/manager/cubits/tasbeeh_cubit/TasbeehCubit.dart';

class TsbeehItem extends StatelessWidget {
  const TsbeehItem({super.key, required this.tsbeehText});
  final String tsbeehText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<Tasbeehcubit>(context).chooseZkr(tsbeehText);
      },
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffe3e3c6),
        ),
        child: Center(
          child: Text(
            textDirection: TextDirection.rtl,
            tsbeehText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
