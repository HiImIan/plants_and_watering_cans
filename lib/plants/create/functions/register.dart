import 'package:flutter/material.dart';
import 'package:josues_plants/plants/create/functions/notification.dart';
import 'package:josues_plants/plants/create/functions/values.dart';
import 'package:josues_plants/plants/create/main_screen.dart';
import 'package:josues_plants/firebase/connect.dart' as userneed;

// Registra no banco de dados as informações dos campos requisitados

Future realtimeRegister(context) async {
  await userneed.database.child("Plants").push().set({
    "plantName": registerPlantName.text,
    "plantWater": double.parse(registerWaterNeed.text),
    "plantTimes": int.parse(registerWaterTimesADay.text)
  }).whenComplete(() {
    ctrolLButtonRPlant.negative();
    Navigator.pop(context);
    plantCreateSucess(context);
  });
}
