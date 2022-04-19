import 'package:flutter/material.dart';

// Widget que ajuda a entender como funciona o cadastro de novos regadores
helpCreateWcan(context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Center(child: Text('Como cadastrar')),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                  'Esses campos servem para cadastrar as informações básicas de um regador automático do qual fará parte do sistema, sendo preciso um nome para identificação, quantos vasos de plantas ele consegue irrigar e se o seu sensor (caso tenha) não irrigará quando chover.'),
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
