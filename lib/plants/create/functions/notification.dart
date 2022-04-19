import 'package:flutter/material.dart';
import 'package:josues_plants/plants/create/functions/register.dart';
import 'package:josues_plants/plants/create/functions/values.dart';
import 'package:josues_plants/plants/create/main_screen.dart';

// Tem o propósito de notificar algo com uma pequena tela de poucas interações com o usuário

// Pede uma confirmação antes de efetuar o registro no banco de dados
Future<void> notifyRegisterConfimation(contextMain) async {
  ctrolLButtonRPlant.positive();
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
                    ctrolLButtonRPlant.negative();
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

                    realtimeRegister(contextMain);
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
      ctrolLButtonRPlant.negative();
    }
  });
}

// Informa que os dados foram salvos
void plantCreateSucess(context) {
  showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Sucesso!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(registerPlantName.text + " teve seu cadastro concluido"),
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
