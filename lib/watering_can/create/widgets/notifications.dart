import 'package:flutter/material.dart';
import 'package:josues_plants/watering_can/create/functions/register.dart';
import 'package:josues_plants/watering_can/create/functions/values.dart';
import 'package:josues_plants/watering_can/create/main_screen.dart';

// Exige uma confirmação do usuário para efetuar o registro do regador
Future<void> notifyRegisterWcanConfimation(contextMain) async {
  ctrolLButtonRWcan.positive();
  bool result = false;
  return showDialog<void>(
    context: contextMain,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Deseja confirmar esse registro?',
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
                    ctrolLButtonRWcan.negative();
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

                    registerWcan(contextMain);
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
      ctrolLButtonRWcan.negative();
    }
  });
}

// Informa que o regador foi registrado com sucesso
void wCanCreateSucess(context) {
  showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Sucesso!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(registerWcanName.text + " teve seu cadastro concluido"),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Certo'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
