import 'package:flutter/material.dart';

// Widget que auxilia a entender como funciona a tela de gerenciamento de plantas
helpAdmPlant(context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Center(child: Text('Funções disponiveis')),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                  'Essa aba serve para administrar as plantas antes cadastradas, podendo filtrar por nome para então:\n\nEditar: Ao clicar no ícone amarelo é disponibilizado uma visualização parecida com o cadastro da planta que poderá ser feita as alterações.\n\nExcluir: Ao clicar no ícone de "X".\n\nVisualizar: Conforme é demonstrado na lista de plantas cadastrados.'),
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
