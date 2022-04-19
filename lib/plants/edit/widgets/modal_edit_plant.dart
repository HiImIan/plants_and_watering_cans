import 'package:flutter/material.dart';
import 'package:josues_plants/plants/edit/fuctions/values.dart';
import 'package:josues_plants/plants/edit/main_screen.dart';
import 'package:josues_plants/plants/edit/widgets/notification.dart';
import 'package:josues_plants/plants/edit/widgets/plant_fields.dart';

// Aba que tem o propósito de permitir a alteração de dados das plantas
Widget editValues(index, _update, context, item) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.7,
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
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 11, bottom: 15),
                child: Center(
                    child: Text(
                  "Editar Especificações",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("Nome: " + item.plantName.toString(),
                            style: const TextStyle(
                                height: 1.4, fontWeight: FontWeight.bold)),
                        Text("Quant. Água: " + item.plantWater.toString() + "L",
                            style: const TextStyle(
                                height: 1.4, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Center(
                      child: Text(
                          "Quant. Irrigações: " +
                              item.plantTimes.toString() +
                              " p/ Dia",
                          style: const TextStyle(
                              height: 1.4, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        // Widget muito extenso que é chamado de fora
        editPlantsFields(context, index),
        Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all(const Size(100, 50))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Voltar", style: TextStyle(fontSize: 18))),
              ElevatedButton(
                onPressed: (ctrolLButtonUPlant.value)
                    ? null
                    : () {
                        if (editPlantFormKey.currentState!.validate()) {
                          notifyEditConfimation(context, index, _update);
                        }
                      },
                child: (ctrolLButtonUPlant.value)
                    ? const SizedBox(
                        height: 15,
                        width: 15,
                        child: CircularProgressIndicator(
                          strokeWidth: 5,
                        ),
                      )
                    : const Text(
                        "Atualizar",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 50), primary: Colors.blue),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
