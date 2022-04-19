import 'package:flutter/material.dart';
import 'package:josues_plants/routine/functions/create/register.dart';
import 'package:josues_plants/routine/functions/values.dart';

// Requisita uma confirmação para prosseguir com a criação da rotina
Future<void> notifyEditConfimation(
    contextMain, index, _update, wCanItem) async {
  ctrolLButtonRout.positive();
  bool result = false;
  return showDialog<void>(
    context: contextMain,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Deseja confirmar a criação dessa rotina?',
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
                    ctrolLButtonRout.negative();
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

                    realtimeRegisterRout(contextMain, index, wCanItem);
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
      ctrolLButtonRout.negative();
    }
  });
}

void wcanUpdateSucess(context) {
  showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Sucesso!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text("Sua rotina foi criada com sucesso!"),
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
