import 'package:flutter/material.dart';
import 'package:josues_plants/routine/functions/values.dart';
import 'package:josues_plants/routine/main_screen.dart';
import 'package:josues_plants/routine/widgets/delete/confirmation.dart';

// Especifica o item que será exibido e suas informações
Widget routListItem(context, _update) {
  return SizedBox(
      height: MediaQuery.of(context).size.height * 0.38,
      child: ValueListenableBuilder(
          valueListenable: controllerRoutineListLength,
          builder: (context, value, child) {
            return Visibility(
              visible: listRoutValues.isNotEmpty,
              replacement: const Padding(
                padding: EdgeInsets.only(top: 70),
                child: Text(
                  "Nenhuma rotina existente",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              child: ListView.builder(
                  itemCount: listRoutValues.length,
                  itemBuilder: (context, index) {
                    var routValue = listRoutValues[index];

                    return Column(
                      children: [
                        Card(
                          child: ListTile(
                            title: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    routValue.routName.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text("De: " + routValue.routWcan.toString())
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                      "H. Inicio: " +
                                          routValue.routInitial.toString(),
                                      style: const TextStyle(fontSize: 14)),
                                ),
                                Text("H. Fim: " + routValue.routEnd.toString(),
                                    style: const TextStyle(fontSize: 14)),
                              ],
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  bool result = false;
                                  deleteConfirmation(result, context, index);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ),
                        ),
                      ],
                    );
                  }),
            );
          }));
}
