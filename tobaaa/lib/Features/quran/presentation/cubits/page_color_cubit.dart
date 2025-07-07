import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:toba2/constants.dart';
import 'package:toba2/core/services/shard_pref_service.dart';

part 'page_color_state.dart';

class PageColorCubit extends Cubit<PageColorState> {
  PageColorCubit() : super(PageColorInitial());

  changePageColor(int currentIndex) async {
    await ShardPrefService.setInt(pageColor, currentIndex);
    emit(PageColorChanged());
  }
}
