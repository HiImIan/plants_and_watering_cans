import 'package:flutter/material.dart';
import 'package:josues_plants/plants/create/main_screen.dart';

// São campos preenchiveis pelo usuário sobre suas plantas para que posteriormente sejam lidos e entregues ao banco de dados

Widget createPlantsFields(context) {
  return Column(
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
            controller: registerPlantName,
            validator: (value) {
              if (value!.isEmpty) {
                return "Campo Obrigatório";
              }

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
            controller: registerWaterNeed,
            validator: (value) {
              bool isNumeric(String string) {
                if (string.isEmpty) {
                  return false;
                }
                return double.tryParse(string) != null;
              }

              if (value!.isEmpty) {
                return "Campo Obrigatório";
              }
              if (!isNumeric(value)) {
                return 'Use apenas números e "." para valores fragmentados';
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
          controller: registerWaterTimesADay,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Campo obrigatório';
            }
            bool isNumeric(String string) {
              if (string.isEmpty) {
                return false;
              }
              return int.tryParse(string) != null;
            }

            if (!isNumeric(value) || value.contains(".")) {
              return "Use apenas numeros";
            }
            return null;
          },
        ),
      ),
    ],
  );
}
