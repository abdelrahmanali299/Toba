import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toba2/Features/prayerTime/presentation/views/widgets/onePrayercontainer.dart';

class PrayerTimesTable extends StatelessWidget {
  const PrayerTimesTable({super.key, this.prayerTimes});
  final PrayerTimes? prayerTimes;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: MediaQuery.of(context).size.height * .02,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        onePrayerContainer(
            prayerName: 'الفجر',
            prayerTime: formatprayertime(prayerTimes?.fajr ?? DateTime.now())),
        onePrayerContainer(
            prayerName: 'الشروق',
            prayerTime:
                formatprayertime(prayerTimes?.sunrise ?? DateTime.now())),
        onePrayerContainer(
            prayerName: 'الظهر',
            prayerTime: formatprayertime(prayerTimes?.dhuhr ?? DateTime.now())),
        onePrayerContainer(
            prayerName: 'العصر',
            prayerTime: formatprayertime(prayerTimes?.asr ?? DateTime.now())),
        onePrayerContainer(
            prayerName: 'المغرب',
            prayerTime:
                formatprayertime(prayerTimes?.maghrib ?? DateTime.now())),
        onePrayerContainer(
            prayerName: 'العشاء',
            prayerTime: formatprayertime(prayerTimes?.isha ?? DateTime.now())),
      ],
    );
  }
}

String formatprayertime(DateTime date) {
  return DateFormat('hh:mm').format(date);
}
