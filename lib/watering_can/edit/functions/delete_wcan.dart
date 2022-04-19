import 'package:flutter/material.dart';
import 'package:josues_plants/watering_can/edit/functions/values.dart';
import 'package:josues_plants/watering_can/edit/main_screen.dart';
import 'package:josues_plants/firebase/connect.dart' as userneed;
import 'package:josues_plants/watering_can/edit/widgets/wcan_search_bar.dart';

// Responsável por excluir do bando de dados o que regador especificado
void deleteWcan(result, context, index) {
  var valueKey = 0;
  if (controllerSearchWcan.value.isNotEmpty) {
    for (var item in listWcansValues) {
      if (controllerSearchWcan.value[index]
          .toString()
          .contains(item.toString())) {
        break;
      } else {
        valueKey++;
      }
    }
  }
  result = true;
  Navigator.of(context).pop();
  userneed.database
      .child("Wcans")
      .child(listWcansKeys[valueKey])
      .remove()
      .whenComplete(() {
    listWcansValues.removeAt(valueKey);
    listWcansKeys.removeAt(valueKey);
    if (searchWcan.text.isNotEmpty) {
      searchWcan.clear();
      runWcanFilter("");
    }
    controllerWcanListLength.change();
  });
}
