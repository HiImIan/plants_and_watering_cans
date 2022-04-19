import 'package:flutter/material.dart';
import 'package:josues_plants/plants/edit/fuctions/values.dart';

import 'package:josues_plants/plants/edit/main_screen.dart';
import 'package:josues_plants/plants/edit/widgets/search_bar.dart';
import 'package:josues_plants/firebase/connect.dart' as userneed;

// Responsável por retirar a planta cadastrada do banco de dados
void deletePlant(result, context, index) {
  var valueKey = 0;
  if (controllerSearchPlant.value.isNotEmpty) {
    for (var item in listPlantsValues) {
      if (controllerSearchPlant.value[index]
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
      .child("Plants")
      .child(listPlantsKeys[valueKey])
      .remove()
      .whenComplete(() {
    listPlantsValues.removeAt(valueKey);
    listPlantsKeys.removeAt(valueKey);
    if (searchPlant.text.isNotEmpty) {
      searchPlant.clear();
      runPlantFilter("");
    }
    controllerPlantListLength.change();
  });
}
