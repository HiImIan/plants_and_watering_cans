import 'package:flutter/material.dart';
import 'package:josues_plants/watering_can/create/functions/values.dart';
import 'package:josues_plants/watering_can/create/main_screen.dart';
import 'package:josues_plants/watering_can/create/widgets/notifications.dart';
import 'package:josues_plants/firebase/connect.dart' as userneed;

// Define o registro de um novo regador
Future registerWcan(context) async {
  await userneed.database.child("Wcans").push().set({
    "wCanName": registerWcanName.text,
    "wCanCapacity": int.parse(registerWcanCap.text),
    "wCanRain": checkRain.value,
  }).whenComplete(() {
    ctrolLButtonRWcan.negative();
    Navigator.pop(context);
    wCanCreateSucess(context);
  });
}
