import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toba2/Features/prayerTime/presentation/manager/cubits/prayercubit/prayertimes_cubit.dart';
import 'package:toba2/Features/prayerTime/presentation/views/widgets/prayer_times.dart';

class PrayerTimesPage extends StatelessWidget {
  const PrayerTimesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/Toba_icon.jpg'),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'توبة',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 120,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .08,
                  ),
                  PrayerTime(
                    prayerTimes:
                        BlocProvider.of<PrayertimesCubit>(context).prayerTimes,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
