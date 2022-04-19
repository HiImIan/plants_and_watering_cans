import 'package:flutter/material.dart';
import 'package:josues_plants/routine/functions/create/check_plants.dart';
import 'package:josues_plants/routine/functions/values.dart';
import 'package:josues_plants/routine/widgets/create/form_field.dart';
import 'package:josues_plants/routine/widgets/create/notification.dart';
import 'package:josues_plants/routine/main_screen.dart';

// Aba que é feita toda a interação para registrar uma nova rotina de um regador
modalRoutine(index, _update, context, wCanItem) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.85,
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.blue[300],
              border: const Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              )),
          child: Column(
            children: const [
              Padding(
                padding:
                    EdgeInsets.only(top: 11, bottom: 15, left: 15, right: 15),
                child: Center(
                    child: Text(
                  "Configure a rotina desejada",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: routFormFields(),
        ),
        Text("Máximo de plantas " +
            checkIndex.length.toString() +
            "/" +
            listWcansValues[index].wCanCapacity.toString()),
        routineFields(context, index, _update),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Voltar",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(130, 50), primary: Colors.blue),
              ),
              ValueListenableBuilder(
                  valueListenable: ctrolLButtonRout,
                  builder: (context, value, child) {
                    return ElevatedButton(
                      onPressed: (ctrolLButtonRout.value)
                          ? null
                          : () {
                              if (routineFormKey.currentState!.validate()) {
                                notifyEditConfimation(
                                        context, index, _update, wCanItem)
                                    .whenComplete(
                                        () => ctrolLButtonRout.negative());
                              }
                            },
                      child: (ctrolLButtonRout.value)
                          ? const SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(
                                strokeWidth: 5,
                              ),
                            )
                          : const Text(
                              "Confirmar",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 50), primary: Colors.blue),
                    );
                  })
            ],
          ),
        ),
      ],
    ),
  );
}
