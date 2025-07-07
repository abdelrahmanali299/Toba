import 'package:adhan/adhan.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toba2/Features/prayerTime/presentation/manager/cubits/prayercubit/prayertimes_states.dart';
import 'package:toba2/Features/prayerTime/presentation/views/services/location_service.dart';

class PrayertimesCubit extends Cubit<PrayertimesStates> {
  PrayertimesCubit() : super(InitialStatePrayerTimes());

  @override
  void onChange(Change<PrayertimesStates> change) {
    print(change);
    super.onChange(change);
  }

  var prayerTimes;
  getPrayerTimes() async {
    emit(LoadingStatePrayerTimes());
    try {
      LocationService locationService = LocationService();
      prayerTimes = await locationService.getPrayerTimes();
      emit(SuccessStatePrayerTimes());
    } catch (e) {
      print(e);
      prayerTimes = prayerTimesOnCairo();
      emit(FailureStatePrayerTimes());
    }
  }

  PrayerTimes prayerTimesOnCairo() {
    final params = CalculationMethod.egyptian.getParameters();
    params.madhab = Madhab.shafi;
    return PrayerTimes.today(Coordinates(30.033333, 31.233334), params);
  }
}
