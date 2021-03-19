import 'package:flutter/material.dart';

class Filter with ChangeNotifier {
  String size = "All";
  String pottype = "All";

  String get sizes {
    return size;
  }

  String get pottypes {
    return pottype;
  }

  List<String> finalsize = [];

  List<String> get finalsizes {
    return finalsize;
  }

  bool htol = false;

  String finalpottype = "";
  void fdata(String fsize, String fpottypes, bool hitolw) {
    htol = hitolw;
    size = fsize;
    if (fpottypes != "All") {
      pottype = fpottypes;
      finalpottype = fpottypes.toLowerCase();
    } else {
      pottype = fpottypes;
      finalpottype = null;
    }
    pottype = fpottypes;
    if (size == "Small") {
      int length = finalsize.length;
      finalsize.removeRange(0, length);
      finalsize.addAll([
        "0",
        "2",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
      ]);
      //["0","2","4","5","6","7","8","9","10",];
    } else if (size == "Medium") {
      int length = finalsize.length;
      finalsize.removeRange(0, length);
      finalsize
          .addAll(["11", "12", "13", "14", "15", "16", "17", "18", "19", "20"]);
    } else if (size == "Large") {
      int length = finalsize.length;
      finalsize.removeRange(0, length);
      finalsize.addAll(["41", "39", "32", "28", "25", "24", "21", "22"]);
    } else {
      int length = finalsize.length;
      finalsize.removeRange(0, length);
      finalsize.addAll([]);
    }

    print(finalsize);
    notifyListeners();
  }
}
