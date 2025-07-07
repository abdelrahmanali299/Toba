import 'package:flutter/material.dart';

class onePrayerContainer extends StatelessWidget {
  const onePrayerContainer(
      {super.key, required this.prayerName, this.prayerTime});
  final String? prayerName, prayerTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xff755033).withOpacity(.7),
      ),
      child: Row(
        spacing: 70,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        textDirection: TextDirection.rtl,
        children: [
          Text(
            prayerName ?? '',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            prayerTime ?? '',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
