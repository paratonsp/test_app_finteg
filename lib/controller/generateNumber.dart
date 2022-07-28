// ignore_for_file: file_names, no_duplicate_case_values, avoid_print, prefer_const_constructors

import 'package:test_app_finteg/model/formatNumber.dart';

class GenerateNumber {
  static load(int num) async {
    List<ResultNumber> tempNum = [];
    List<ResultNumber> resNum = [];
    List<ResultNumber> formatNumAdd = [
      ResultNumber(3, "Fintegra"),
      ResultNumber(2, "Homido Indonesia"),
      ResultNumber(10, "Fintegra Homido Indonesia"),
    ];
    var z = 0;

    for (int i = 0; i < 4; i++) {
      if (i == 3) {
        i = 0;
      }
      z = z + formatNumAdd[i].id;
      if (z > num) {
        break;
      } else {
        resNum.add(ResultNumber(z, formatNumAdd[i].text));
      }
    }

    for (int i = 0; i < num; i++) {
      var numSub = i + 1;
      tempNum.add(ResultNumber(numSub, ""));
    }

    for (int i = 0; i < resNum.length; i++) {
      var x = resNum[i].id;
      tempNum[x - 1] = ResultNumber(x, resNum[i].text);
    }

    tempNum.sort((a, b) => a.id.compareTo(b.id));
    return tempNum;
  }
}
