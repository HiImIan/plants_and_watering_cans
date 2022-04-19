import 'package:flutter/material.dart';
import 'package:josues_plants/watering_can/edit/functions/delete_wcan.dart';
import 'package:josues_plants/watering_can/edit/functions/update_wcan.dart';
import 'package:josues_plants/watering_can/edit/functions/values.dart';

// Exige uma confirmação para exclusão de um regador
Future deleteConfirmation(result, context, index) {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Deseja mesmo excluir esse regador?',
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
                    ctrolLButtonUWcan.negative();
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
                    deleteWcan(result, context, index);
                  },
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

// Exige uma confirmação para editar o regador especificado
Future<void> notifyEditConfimation(contextMain, index, _update) async {
  ctrolLButtonUWcan.positive();
  bool result = false;
  return showDialog<void>(
    context: contextMain,
    barrierDismissible: false, // user must tap button!
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
                    ctrolLButtonUWcan.negative();
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

                    realtimeEditWcan(contextMain, index).whenComplete(() {
                      ctrolLButtonUWcan.negative();
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
      ctrolLButtonUWcan.negative();
    }
  });
}

// Informa que a alteração foi bem sucedida
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
              Text("As informações do regador foram alteradas!"),
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
