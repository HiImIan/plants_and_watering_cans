import 'package:flutter/material.dart';

// Esse Widget informa ao usuário informações sobre a tela inicial
helpInitial(context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Center(child: Text('Como Utilizar')),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                  'Plantas: Para interagir com as opções disponíveis das plantas, clique no ícone do vaso de planta com o escrito abaixo "Plantas" e escolha a opção desejada posteriormente.\n\nRegadores: Para interagir com os regadores automáticos pressione o ícone do regador com o escrito abaixo "Regadores" e escolha posteriormente a interação desejada.\n\nRotinas: Para administrar as rotinas de irrigação pressione o ícone de regador irrigando um vaso de planta com a escrita  abaixo "Rotinas".'),
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
