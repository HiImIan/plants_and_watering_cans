import 'package:flutter/material.dart';

// Widget que auxilia o usuário a entender como funciona a tela de cadastro de planta
helpCreatePlant(context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Center(child: Text('Como cadastrar')),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                  'Aqui é feito o cadastro das plantas, necessitando atribuir um nome Único, especificar quanta água a planta precisa e quantas vezes ela deve ser irrigada.'),
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
