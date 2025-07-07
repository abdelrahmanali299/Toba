import 'package:toba2/Features/quran/presentation/views/widgets/juz_list_view.dart';

getJuzName(int pageNumber) {
  switch (pageNumber) {
    case >= 1 && < 22:
      return JuzListView.juzsNames[0];
    case >= 22 && < 42:
      return JuzListView.juzsNames[1];
    case >= 42 && < 62:
      return JuzListView.juzsNames[2];
    case >= 62 && < 82:
      return JuzListView.juzsNames[3];
    case >= 82 && < 102:
      return JuzListView.juzsNames[4];
    case >= 102 && < 121:
      return JuzListView.juzsNames[5];
    case >= 121 && < 142:
      return JuzListView.juzsNames[6];
    case >= 142 && < 162:
      return JuzListView.juzsNames[7];
    case >= 162 && < 182:
      return JuzListView.juzsNames[8];
    case >= 182 && < 201:
      return JuzListView.juzsNames[9];
    case >= 201 && < 222:
      return JuzListView.juzsNames[10];
    case >= 222 && < 242:
      return JuzListView.juzsNames[11];
    case >= 242 && < 262:
      return JuzListView.juzsNames[12];
    case >= 262 && < 282:
      return JuzListView.juzsNames[13];
    case >= 282 && < 302:
      return JuzListView.juzsNames[14];
    case >= 302 && < 322:
      return JuzListView.juzsNames[15];
    case >= 322 && < 342:
      return JuzListView.juzsNames[16];
    case >= 342 && < 362:
      return JuzListView.juzsNames[17];
    case >= 362 && < 382:
      return JuzListView.juzsNames[18];
    case >= 382 && < 402:
      return JuzListView.juzsNames[19];
    case >= 402 && < 422:
      return JuzListView.juzsNames[20];
    case >= 422 && < 442:
      return JuzListView.juzsNames[21];
    case >= 442 && < 462:
      return JuzListView.juzsNames[22];
    case >= 462 && < 482:
      return JuzListView.juzsNames[23];
    case >= 482 && < 502:
      return JuzListView.juzsNames[24];
    case >= 502 && < 522:
      return JuzListView.juzsNames[25];
    case >= 522 && < 542:
      return JuzListView.juzsNames[26];
    case >= 542 && < 562:
      return JuzListView.juzsNames[27];
    case >= 562 && < 582:
      return JuzListView.juzsNames[28];
    case >= 582:
      return JuzListView.juzsNames[29];
  }
}
