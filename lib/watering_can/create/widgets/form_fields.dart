import 'package:flutter/material.dart';
import 'package:josues_plants/watering_can/create/functions/values.dart';
import 'package:josues_plants/watering_can/create/main_screen.dart';

// Determina a estrutura dos campos para criação do regador
Widget createWcansFields(context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
          child: TextFormField(
            cursorColor: Colors.blue,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Apelido para o regador",
              labelStyle: TextStyle(color: Colors.black, fontSize: 17.0),
            ),
            style: const TextStyle(fontSize: 14.0),
            controller: registerWcanName,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo obrigatório';
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
            labelText: "Quant. Máxima de vasos que pode irrigar",
            labelStyle: TextStyle(color: Colors.black, fontSize: 17.0),
          ),
          style: const TextStyle(fontSize: 14.0),
          controller: registerWcanCap,
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

            if (!isNumeric(value)) {
              return "Use apenas numeros";
            }
            return null;
          },
        ),
      ),
      Row(
        children: [
          ValueListenableBuilder(
              valueListenable: checkRain,
              builder: (context, value, child) {
                return Checkbox(
                    side: const BorderSide(width: 2.3),
                    checkColor: Colors.white,
                    value: checkRain.value,
                    onChanged: (bool? value) {
                      checkRain.change(value!);
                    });
              }),
          const Text("Não irrigar caso chova")
        ],
      ),
    ],
  );
}
