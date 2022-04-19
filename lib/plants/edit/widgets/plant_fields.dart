import 'package:flutter/material.dart';
import 'package:josues_plants/plants/edit/main_screen.dart';

// Campos para o usuário preencher que permitirá a edição de uma planta cadastrada no banco de dados
Widget editPlantsFields(context, index) {
  return Padding(
    padding: const EdgeInsets.only(top: 60),
    child: Form(
      key: editPlantFormKey,
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
                    labelText: "Nome da Planta",
                    labelStyle: TextStyle(color: Colors.black, fontSize: 17.0),
                  ),
                  style: const TextStyle(fontSize: 14.0),
                  controller: editPlantName,
                  validator: (value) {
                    return null;
                  },
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
                    labelText: "Necessidade de água (L/Dia)",
                    labelStyle: TextStyle(color: Colors.black, fontSize: 17.0),
                  ),
                  style: const TextStyle(fontSize: 14.0),
                  controller: editWaterNeed,
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.blue,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Irrigações por dia",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 17.0),
                ),
                style: const TextStyle(fontSize: 14.0),
                controller: editWaterTimesADay,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    bool isNumeric(String string) {
                      if (string.isEmpty) {
                        return false;
                      }
                      return int.tryParse(string) != null;
                    }

                    if (!isNumeric(value) || value.contains(".")) {
                      return "Use apenas numeros";
                    }
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
