import 'package:flutter/material.dart';
import 'package:josues_plants/watering_can/edit/functions/values.dart';
import 'package:josues_plants/watering_can/edit/main_screen.dart';
import 'package:josues_plants/firebase/connect.dart' as userneed;
import 'package:josues_plants/watering_can/edit/widgets/notifications.dart';
import 'package:josues_plants/watering_can/edit/widgets/wcan_search_bar.dart';

// Efetua a atualização de um regador especificado
Future realtimeEditWcan(context, index) async {
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
  if (editWcanName.text.isNotEmpty) {
    await userneed.database
        .child("Wcans")
        .child(listWcansKeys[valueKey])
        .update({
      "wCanName": editWcanName.text,
    }).whenComplete(
            () => listWcansValues[valueKey].wCanName = editWcanName.text);
  }

  if (editWcanCapacity.text.isNotEmpty) {
    await userneed.database
        .child("Wcans")
        .child(listWcansKeys[valueKey])
        .update({
      "wCanCapacity": int.parse(editWcanCapacity.text),
    }).whenComplete(() => listWcansValues[valueKey].wCanCapacity =
            int.parse(editWcanCapacity.text));
  }

  if (checkEditRain.value != listWcansValues[valueKey].wCanRain) {
    await userneed.database
        .child("Wcans")
        .child(listWcansKeys[valueKey])
        .update({
      "wCanRain": checkEditRain.value,
    }).whenComplete(
            () => listWcansValues[valueKey].wCanRain = checkEditRain.value);
  }
  Navigator.pop(context);
  if (searchWcan.text.isNotEmpty) {
    searchWcan.clear();
    runWcanFilter("");
  }
  controllerWcanListLength.recall();
  wcanUpdateSucess(context);
}
