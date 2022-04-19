import 'package:flutter/material.dart';

// Widget que ajuda a entender como funciona a administração dos regadores cadastrados
helpAdmWcan(context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Center(child: Text('Funções disponiveis')),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                  'Essa aba serve para administrar os regadores antes cadastrados, podendo filtrar por nome para então:\n\nEditar: Ao clicar no ícone amarelo é disponibilizado uma visualização parecida com o cadastro da planta que poderá ser feita as alterações.\n\nExcluir: Ao clicar no ícone de "X".\n\nVisualizar: Conforme é demonstrado na lista de regadores cadastrados.'),
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
