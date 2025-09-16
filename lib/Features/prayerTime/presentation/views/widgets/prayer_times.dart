import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:toba2/Features/prayerTime/presentation/views/widgets/prayer_times_table.dart';

class PrayerTime extends StatelessWidget {
  const PrayerTime({super.key, this.prayerTimes});

  final PrayerTimes? prayerTimes;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: PrayerTimesTable(prayerTimes: prayerTimes));
  }
}
