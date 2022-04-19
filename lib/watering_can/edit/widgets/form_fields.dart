import 'package:flutter/material.dart';
import 'package:josues_plants/watering_can/edit/functions/values.dart';
import 'package:josues_plants/watering_can/edit/main_screen.dart';

// Especifica como será a estrutura dos campos de edição dos regadores
Widget editWcansFields(context, index) {
  return Padding(
    padding: const EdgeInsets.only(top: 60),
    child: Form(
      key: editWcanFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                child: TextFormField(
                  cursorColor: Colors.blue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nome do Regador",
                    labelStyle: TextStyle(color: Colors.black, fontSize: 17.0),
                  ),
                  style: const TextStyle(fontSize: 14.0),
                  controller: editWcanName,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.blue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Quant. Máxima de vasos que pode irrigar",
                    labelStyle: TextStyle(color: Colors.black, fontSize: 17.0),
                  ),
                  style: const TextStyle(fontSize: 14.0),
                  controller: editWcanCapacity,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      bool isNumeric(String string) {
                        if (string.isEmpty) {
                          return false;
                        }
                        return double.tryParse(string) != null;
                      }

                      if (!isNumeric(value)) {
                        return 'Use apenas números e "." para valores fragmentados';
                      }
                    }

                    return null;
                  },
                ),
              ),
            ),
            Row(
              children: [
                ValueListenableBuilder(
                    valueListenable: checkEditRain,
                    builder: (context, value, child) {
                      return Checkbox(
                          side: const BorderSide(width: 2.3),
                          checkColor: Colors.white,
                          value: checkEditRain.value,
                          onChanged: (bool? value) {
                            checkEditRain.change(value!);
                          });
                    }),
                const Text("Não irrigar caso chova")
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
