import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toba2/Features/tasbeeh/presentation/manager/cubits/tasbeeh_cubit/TasbeehStates.dart';

class Tasbeehcubit extends Cubit<Tasbeehstates> {
  Tasbeehcubit() : super(TasbeehInitialState());

  String currentzkr = 'سبحان الله';
  int zkrCount = 0;

  void chooseZkr(String zkr) {
    currentzkr = zkr;
    zkrCount = 0;
    emit(TasbeehSuccessState());
  }

  void zkrIncreament() {
    emit(TasbeehIncreament());
  }

  void zkrReset() {
    emit(TasbeehReset());
  }
}
