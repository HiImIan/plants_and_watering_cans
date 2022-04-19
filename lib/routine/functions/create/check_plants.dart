import 'package:flutter/material.dart';
import 'package:josues_plants/routine/main_screen.dart';

// Mostra uma lista com as plantas cadastradas e da a possibilidade de marcar qual dessas plantas será ou não posta na rotina que esta sendo criada
Widget routineFields(context, index, _update) {
  var limit = listWcansValues[index].wCanCapacity;
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.36,
    child: ListView.builder(
        itemCount: listPlantValues.length,
        itemBuilder: (context, index) {
          var plantItem = listPlantValues[index];

          return Column(
            children: [
              Card(
                child: CheckboxListTile(
                  activeColor: Colors.green[700],
                  selected: true,
                  onChanged: (bool? value) {
                    if (checkIndex.length + 1 <= limit!) {
                      if (value == false) {
                        checkIndex.removeWhere((element) => element == index);
                      } else {
                        checkIndex.add(index);
                      }
                      _update(() {
                        checksItens[index] = value!;
                      });
                    }
                  },
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          plantItem.plantName.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ), //2
                      ),
                      Text(
                          "Quant. Água: " +
                              plantItem.plantWater.toString() +
                              " L",
                          style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                  // subtitle: Text(listOfCpy[index].age),
                  subtitle: Text(
                    "Irrigações p/ dia:" + plantItem.plantTimes.toString(),
                    style: const TextStyle(fontSize: 14),
                  ),
                  value: checksItens[index],
                ),
                //
              ),
            ],
          );
        }),
  );
}
