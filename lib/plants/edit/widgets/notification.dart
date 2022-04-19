import 'package:flutter/material.dart';
import 'package:josues_plants/plants/edit/fuctions/update_plant.dart';
import 'package:josues_plants/plants/edit/fuctions/values.dart';

// Exige uma confirmação do que será feito para então atualizar o cadastro de uma planta
Future<void> notifyEditConfimation(contextMain, index, _update) async {
  ctrolLButtonUPlant.positive();
  bool result = false;
  return showDialog<void>(
    context: contextMain,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Deseja confirmar essa atualização?',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                child: TextButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(
                          MediaQuery.of(context).size.width * 0.25,
                          MediaQuery.of(context).size.width * 0.05)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(color: Colors.white))),
                  child: const Text(
                    'Não...',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    result = true;
                    ctrolLButtonUPlant.negative();
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SizedBox(
                child: TextButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(
                        MediaQuery.of(context).size.width * 0.25,
                        MediaQuery.of(context).size.width * 0.05)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green.shade700),
                  ),
                  child: const Text(
                    'Sim!',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    result = true;
                    Navigator.of(context).pop();
                    realtimeEditPlant(contextMain, index).whenComplete(() {
                      ctrolLButtonUPlant.negative();
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      );
    },
  ).whenComplete(() {
    if (result == false) {
      ctrolLButtonUPlant.negative();
    }
  });
}

// Informa que a operação foi um sucesso
void plantUpdateSucess(context) {
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Sucesso!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text("As informações da planta foram alteradas!"),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok!'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
