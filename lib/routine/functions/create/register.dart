import 'package:flutter/material.dart';
import 'package:josues_plants/routine/functions/values.dart';
import 'package:josues_plants/routine/main_screen.dart';
import 'package:josues_plants/firebase/connect.dart' as userneed;
import 'package:josues_plants/routine/widgets/create/notification.dart';

// Registra a nova rotina no banco de dados com as informações preenchidas e escolhidas
Future realtimeRegisterRout(context, index, wCanItem) async {
  await userneed.database.child("Routine").push().set({
    "routName": routineName.text,
    "routInitial": routineInicialTime.text,
    "routEnd": routineEndTime.text,
    "routQty": (routineAmountIrrigation.text.isEmpty)
        ? 1
        : int.parse(routineAmountIrrigation.text),
    "routIndexs": checkIndex.toString().replaceAll("[", "").replaceAll("]", ""),
    "routWcan": wCanItem
  });
  Navigator.pop(context);
  if (searchWcan.text.isNotEmpty) {
    searchWcan.clear();
  }
  controllerRoutineListLength.recall();
  ctrolLButtonRout.negative();
  wcanUpdateSucess(context);
}
