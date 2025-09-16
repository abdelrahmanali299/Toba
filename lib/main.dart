import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toba2/Features/prayerTime/presentation/manager/cubits/prayercubit/prayertimes_cubit.dart';
import 'package:toba2/Features/quran/presentation/cubits/page_color_cubit.dart';
import 'package:toba2/Features/splash/presentation/views/splash_view.dart';
import 'package:toba2/Features/tasbeeh/presentation/manager/cubits/tasbeeh_cubit/TasbeehCubit.dart';
import 'package:toba2/core/services/shard_pref_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ShardPrefService.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Tasbeehcubit()),
        BlocProvider(create: (context) => PrayertimesCubit()),
        BlocProvider(create: (context) => PageColorCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Amiri'),
        debugShowCheckedModeBanner: false,
        home: SplashView(),
      ),
    );
  }
}
