import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toba2/Features/tasbeeh/presentation/manager/cubits/tasbeeh_cubit/TasbeehCubit.dart';

class Circletasbeeh extends StatelessWidget {
  const Circletasbeeh({super.key, required this.count});
  final count;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color(0xffe3e3c6),
      radius: MediaQuery.of(context).size.width * .4,
      child: Column(
        spacing: 15,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                textAlign: TextAlign.center,
                BlocProvider.of<Tasbeehcubit>(context).currentzkr,
                style: TextStyle(fontSize: 50, color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '${BlocProvider.of<Tasbeehcubit>(context).zkrCount}/$count',
                style: TextStyle(fontSize: 30, color: Color(0xff755033)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
