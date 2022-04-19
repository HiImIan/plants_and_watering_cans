import 'package:flutter/material.dart';
import 'package:josues_plants/routine/functions/values.dart';
import 'package:josues_plants/routine/main_screen.dart';
import 'package:josues_plants/firebase/connect.dart' as userneed;

// Exclui do banco de dados as informações informadas
void deleteRout(result, context, index) {
  result = true;
  Navigator.of(context).pop();
  userneed.database
      .child("Routine")
      .child(listRoutsKeys[index])
      .remove()
      .whenComplete(() {
    if (searchWcan.text.isNotEmpty) {
      searchWcan.clear();
    }
    listRoutValues.removeAt(index);
    listRoutsKeys.removeAt(index);
    controllerRoutineListLength.change();
  });
}
