import 'package:flutter/material.dart';
import 'package:josues_plants/plants/edit/fuctions/values.dart';

import 'package:josues_plants/plants/edit/main_screen.dart';
import 'package:josues_plants/plants/edit/widgets/notification.dart';
import 'package:josues_plants/firebase/connect.dart' as userneed;
import 'package:josues_plants/plants/edit/widgets/search_bar.dart';

// Chamado para editar com novas informações alguma planta que já esta no banco de dados
Future realtimeEditPlant(context, index) async {
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
  if (editPlantName.text.isNotEmpty) {
    await userneed.database
        .child("Plants")
        .child(listPlantsKeys[valueKey])
        .update({
      "plantName": editPlantName.text,
    }).whenComplete(
            () => listPlantsValues[valueKey].plantName = editPlantName.text);
  }

  if (editWaterNeed.text.isNotEmpty) {
    await userneed.database
        .child("Plants")
        .child(listPlantsKeys[valueKey])
        .update({
      "plantWater": double.parse(editWaterNeed.text),
    }).whenComplete(
            () => listPlantsValues[valueKey].plantWater = editWaterNeed.text);
  }

  if (editWaterTimesADay.text.isNotEmpty) {
    await userneed.database
        .child("Plants")
        .child(listPlantsKeys[valueKey])
        .update({
      "plantTimes": int.parse(editWaterTimesADay.text),
    }).whenComplete(() =>
            listPlantsValues[valueKey].plantTimes = editWaterTimesADay.text);
  }
  Navigator.pop(context);
  if (searchPlant.text.isNotEmpty) {
    searchPlant.clear();
    runPlantFilter("");
  }
  controllerPlantListLength.recall();
  plantUpdateSucess(context);
}
