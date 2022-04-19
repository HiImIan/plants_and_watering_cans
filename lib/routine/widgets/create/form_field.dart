import 'package:flutter/material.dart';
import 'package:josues_plants/routine/functions/create/hour_format.dart';
import 'package:josues_plants/routine/main_screen.dart';

Widget routFormFields() {
  return Form(
      key: routineFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              width: 300,
              height: 70,
              child: TextFormField(
                cursorColor: Colors.blue,
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nome da rotina",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 17.0),
                ),
                style: const TextStyle(fontSize: 14.0),
                controller: routineName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Defina um nome";
                  }
                  return null;
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text(
                    "H. Inicial",
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    width: 70,
                    height: 50,
                    child: TextFormField(
                      inputFormatters: [TimeTextInputFormatter()],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: false),
                      cursorColor: Colors.blue,
                      autovalidateMode: AutovalidateMode.always,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: "00:00:00",
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 17.0),
                      ),
                      style: const TextStyle(fontSize: 14.0),
                      controller: routineInicialTime,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Preencha";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    "H. Final",
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    width: 70,
                    height: 50,
                    child: TextFormField(
                      inputFormatters: [TimeTextInputFormatter()],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: false),
                      cursorColor: Colors.blue,
                      autovalidateMode: AutovalidateMode.always,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: "00:00:00",
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 17.0),
                      ),
                      style: const TextStyle(fontSize: 14.0),
                      controller: routineEndTime,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Preencha";
                        }

                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    "Quant. Irrigações",
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    width: 100,
                    height: 50,
                    child: TextFormField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: false),
                      cursorColor: Colors.blue,
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                        hintText: "1",
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 17.0),
                      ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14.0),
                      controller: routineAmountIrrigation,
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          bool isNumeric(String string) {
                            if (string.isEmpty) {
                              return false;
                            }
                            return double.tryParse(string) != null;
                          }

                          if (!isNumeric(value) || value.contains(".")) {
                            return 'Apenas numeros';
                          }
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ));
}
