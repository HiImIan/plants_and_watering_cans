import 'package:flutter/material.dart';
import 'package:josues_plants/watering_can/edit/functions/values.dart';
import 'package:josues_plants/watering_can/edit/main_screen.dart';
import 'package:josues_plants/watering_can/edit/widgets/form_fields.dart';
import 'package:josues_plants/watering_can/edit/widgets/notifications.dart';

//  Aba principal da efetiva alteração do regador especificado
editValues(index, _update, context, item) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.6,
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
            ],
          ),
        ),
        editWcansFields(context, index),
        Padding(
          padding: const EdgeInsets.only(top: 40),
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
                onPressed: (ctrolLButtonUWcan.value)
                    ? null
                    : () {
                        if (editWcanFormKey.currentState!.validate()) {
                          notifyEditConfimation(context, index, _update);
                        }
                      },
                child: (ctrolLButtonUWcan.value)
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
